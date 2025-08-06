# This block configures the AWS provider, telling Terraform that we're going to be creating resources in AWS.
# We specify the region where the resources will be created. It's best practice to use a variable for this.
provider "aws" {
  region = "us-east-1"
}

# This is a special provider configuration for ACM, which requires the us-east-1 region for CloudFront certificates.
provider "aws" {
  alias  = "us-east-1-provider"
  region = "us-east-1"
}

# --------------------------------------------------------------------------------------------------
# FRONTEND RESOURCES (S3)
# --------------------------------------------------------------------------------------------------

resource "aws_s3_bucket" "resume_bucket" {
  bucket = "erik.ml"
  tags = {
    Name        = "Cloud Resume Bucket"
    Project     = "Cloud Resume Challenge"
    ManagedBy   = "Terraform"
  }
}

resource "aws_s3_bucket_website_configuration" "resume_website" {
  bucket = aws_s3_bucket.resume_bucket.id
  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_public_access_block" "resume_public_access" {
  bucket = aws_s3_bucket.resume_bucket.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "resume_bucket_policy" {
  bucket = aws_s3_bucket.resume_bucket.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "PublicReadGetObject",
        Effect    = "Allow",
        Principal = "*",
        Action    = "s3:GetObject",
        Resource  = "${aws_s3_bucket.resume_bucket.arn}/*"
      },
    ]
  })
  depends_on = [aws_s3_bucket_public_access_block.resume_public_access]
}

# This data source processes our HTML template file.
# It will replace the ${api_url} variable with the actual invoke URL from our API Gateway.
data "template_file" "index_template" {
  template = file("./index.html.tpl")
  vars = {
    api_url = aws_api_gateway_stage.prod_stage.invoke_url
  }
}

# This resource uploads our processed index.html file to the S3 bucket.
# Note that the 'source' argument is gone, and we now use 'content'.
resource "aws_s3_object" "index" {
  bucket       = aws_s3_bucket.resume_bucket.id
  key          = "index.html"
  content      = data.template_file.index_template.rendered # Use the rendered template content
  content_type = "text/html"
  etag         = md5(data.template_file.index_template.rendered) # Etag is now based on the rendered content
}

# This resource uploads the CompTIA A+ badge image to the S3 bucket.
resource "aws_s3_object" "cert_badge" {
  bucket       = aws_s3_bucket.resume_bucket.id
  key          = "CompTIAA+.jpeg"
  source       = "./CompTIAA+.jpeg" # Assumes the image is in the same folder
  content_type = "image/jpeg"
  etag         = filemd5("./CompTIAA+.jpeg")
}

resource "aws_s3_object" "error" {
  bucket       = aws_s3_bucket.resume_bucket.id
  key          = "error.html"
  source       = "./error.html"
  content_type = "text/html"
  etag         = filemd5("./error.html")
}

# --------------------------------------------------------------------------------------------------
# BACKEND RESOURCES (DynamoDB, Lambda, IAM, API Gateway)
# --------------------------------------------------------------------------------------------------

resource "aws_dynamodb_table" "resume_counter_table" {
  name           = "cloud-resume-challenge"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "ID"
  attribute {
    name = "ID"
    type = "S"
  }
  tags = {
    Name        = "Cloud Resume Counter Table"
    Project     = "Cloud Resume Challenge"
    ManagedBy   = "Terraform"
  }
}

resource "aws_iam_role" "lambda_exec_role" {
  name = "resume-lambda-exec-role"
  assume_role_policy = jsonencode({
    Version   = "2012-10-17",
    Statement = [
      {
        Action    = "sts:AssumeRole",
        Effect    = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
  tags = {
    Name      = "Resume Lambda Execution Role"
    Project   = "Cloud Resume Challenge"
    ManagedBy = "Terraform"
  }
}

resource "aws_iam_policy" "lambda_dynamodb_policy" {
  name        = "resume-lambda-dynamodb-policy"
  description = "Allows Lambda function to access DynamoDB table and create logs"
  policy = jsonencode({
    Version   = "2012-10-17",
    Statement = [
      {
        Action   = ["dynamodb:UpdateItem", "dynamodb:GetItem"],
        Effect   = "Allow",
        Resource = aws_dynamodb_table.resume_counter_table.arn
      },
      {
        Action   = ["logs:CreateLogGroup", "logs:CreateLogStream", "logs:PutLogEvents"],
        Effect   = "Allow",
        Resource = "arn:aws:logs:*:*:*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_policy_attach" {
  role       = aws_iam_role.lambda_exec_role.name
  policy_arn = aws_iam_policy.lambda_dynamodb_policy.arn
}

data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "./lambda_function.py"
  output_path = "./lambda_function.zip"
}

resource "aws_lambda_function" "visitor_counter_lambda" {
  filename         = data.archive_file.lambda_zip.output_path
  function_name    = "get-resume-visitor-count"
  role             = aws_iam_role.lambda_exec_role.arn
  handler          = "lambda_function.lambda_handler"
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
  runtime          = "python3.9"
  tags = {
    Name      = "Visitor Counter Lambda"
    Project   = "Cloud Resume Challenge"
    ManagedBy = "Terraform"
  }
}

resource "aws_api_gateway_rest_api" "resume_api" {
  name        = "resume-api"
  description = "API for the Cloud Resume Challenge"
}

resource "aws_api_gateway_resource" "visitor_count_resource" {
  rest_api_id = aws_api_gateway_rest_api.resume_api.id
  parent_id   = aws_api_gateway_rest_api.resume_api.root_resource_id
  path_part   = "visitor-count"
}

resource "aws_api_gateway_method" "get_visitor_count_method" {
  rest_api_id   = aws_api_gateway_rest_api.resume_api.id
  resource_id   = aws_api_gateway_resource.visitor_count_resource.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "lambda_integration" {
  rest_api_id             = aws_api_gateway_rest_api.resume_api.id
  resource_id             = aws_api_gateway_resource.visitor_count_resource.id
  http_method             = aws_api_gateway_method.get_visitor_count_method.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.visitor_counter_lambda.invoke_arn
}

resource "aws_api_gateway_method" "options_method" {
  rest_api_id   = aws_api_gateway_rest_api.resume_api.id
  resource_id   = aws_api_gateway_resource.visitor_count_resource.id
  http_method   = "OPTIONS"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "options_integration" {
  rest_api_id = aws_api_gateway_rest_api.resume_api.id
  resource_id = aws_api_gateway_resource.visitor_count_resource.id
  http_method = aws_api_gateway_method.options_method.http_method
  type        = "MOCK"
  request_templates = {
    "application/json" = "{\"statusCode\": 200}"
  }
}

resource "aws_api_gateway_method_response" "options_200" {
  rest_api_id = aws_api_gateway_rest_api.resume_api.id
  resource_id = aws_api_gateway_resource.visitor_count_resource.id
  http_method = aws_api_gateway_method.options_method.http_method
  status_code = "200"
  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" = true,
    "method.response.header.Access-Control-Allow-Methods" = true,
    "method.response.header.Access-Control-Allow-Origin"  = true
  }
}

resource "aws_api_gateway_integration_response" "options_integration_response" {
  rest_api_id = aws_api_gateway_rest_api.resume_api.id
  resource_id = aws_api_gateway_resource.visitor_count_resource.id
  http_method = aws_api_gateway_method.options_method.http_method
  status_code = aws_api_gateway_method_response.options_200.status_code
  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" = "'Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token'",
    "method.response.header.Access-Control-Allow-Methods" = "'GET,OPTIONS'",
    "method.response.header.Access-Control-Allow-Origin"  = "'*'"
  }
}

resource "aws_api_gateway_deployment" "api_deployment" {
  rest_api_id = aws_api_gateway_rest_api.resume_api.id
  lifecycle {
    create_before_destroy = true
  }
  depends_on = [
    aws_api_gateway_integration.lambda_integration,
    aws_api_gateway_integration.options_integration
  ]
}

resource "aws_api_gateway_stage" "prod_stage" {
  deployment_id = aws_api_gateway_deployment.api_deployment.id
  rest_api_id   = aws_api_gateway_rest_api.resume_api.id
  stage_name    = "prod"
}

resource "aws_lambda_permission" "api_gateway_permission" {
  statement_id  = "AllowAPIGatewayToInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.visitor_counter_lambda.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.resume_api.execution_arn}/*/${aws_api_gateway_method.get_visitor_count_method.http_method}${aws_api_gateway_resource.visitor_count_resource.path}"
}

output "api_invoke_url" {
  description = "The invoke URL for the API Gateway stage"
  value       = aws_api_gateway_stage.prod_stage.invoke_url
}

# --------------------------------------------------------------------------------------------------
# NETWORKING & DELIVERY (Route 53, ACM, CloudFront)
# --------------------------------------------------------------------------------------------------

# This data source gets our existing Route 53 hosted zone for our domain.
data "aws_route53_zone" "primary" {
  name = "erik.ml"
}

# This resource requests a new SSL certificate from ACM.
resource "aws_acm_certificate" "resume_cert" {
  provider          = aws.us-east-1-provider # Specify the us-east-1 provider
  domain_name       = "erik.ml"
  subject_alternative_names = ["www.erik.ml"]
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

# This resource creates the DNS records in Route 53 needed to validate the ACM certificate.
resource "aws_route53_record" "cert_validation" {
  for_each = {
    for dvo in aws_acm_certificate.resume_cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.primary.zone_id
}

# This resource waits for the certificate validation to complete.
resource "aws_acm_certificate_validation" "cert_validation_complete" {
  provider                = aws.us-east-1-provider # Specify the us-east-1 provider
  certificate_arn         = aws_acm_certificate.resume_cert.arn
  validation_record_fqdns = [for record in aws_route53_record.cert_validation : record.fqdn]
}

# This is the CloudFront distribution.
resource "aws_cloudfront_distribution" "resume_distribution" {
  origin {
    domain_name = aws_s3_bucket_website_configuration.resume_website.website_endpoint
    origin_id   = "S3-erik.ml"

    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["TLSv1.2"]
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "CloudFront distribution for resume website"
  default_root_object = "index.html"

  aliases = ["erik.ml", "www.erik.ml"]

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "S3-erik.ml"

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  price_class = "PriceClass_100" # Use only North America and Europe to save costs

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn      = aws_acm_certificate_validation.cert_validation_complete.certificate_arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.2_2021"
  }
}

# This creates the A record in Route 53 to point the root domain to CloudFront.
resource "aws_route53_record" "root_domain" {
  zone_id = data.aws_route53_zone.primary.zone_id
  name    = "erik.ml"
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.resume_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.resume_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}

# This creates the A record in Route 53 to point the www subdomain to CloudFront.
resource "aws_route53_record" "www_domain" {
  zone_id = data.aws_route53_zone.primary.zone_id
  name    = "www.erik.ml"
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.resume_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.resume_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Erik Malson | AI and Data Center Engineer</title>
    <style>
        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
            line-height: 1.6;
            color: #333;
            max-width: 800px;
            margin: 20px auto;
            padding: 0 20px;
            background-color: #fdfdfd;
        }
        h1, h2, h3 {
            color: #111;
            border-bottom: 1px solid #eee;
            padding-bottom: 5px;
        }
        h1 {
            font-size: 2.5em;
            text-align: center;
            border-bottom: 2px solid #ddd;
        }
        h2 {
            font-size: 1.8em;
            margin-top: 40px;
        }
        h3 {
            font-size: 1.4em;
            margin-top: 30px;
        }
        .contact-info {
            text-align: center;
            margin-bottom: 30px;
        }
        a {
            color: #007BFF;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
        ul {
            padding-left: 20px;
        }
        li {
            margin-bottom: 8px;
        }
        .company-info { /* This class is no longer used but kept for reference */
            font-style: italic;
            color: #555;
        }
        .section {
            margin-bottom: 30px;
        }
        .cert-list {
            padding-left: 0;
            list-style-type: none;
        }
        /* Rule for project titles */
        .projects-section h3 {
            font-size: 1.0em;
        }
        /* New rules for Professional Experience section */
        .experience-section h3 {
            font-size: 1.0em;
            font-weight: bold;
        }
        .experience-section h3 span {
            font-style: italic;
            font-weight: normal;
            color: #555;
            margin-left: 8px;
        }
        /* New styles for certification badges */
        .certifications-section ul {
            padding-left: 0;
            list-style-type: none;
        }
        .cert-item {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }
        .cert-badge {
            width: 80px;
            height: 80px;
            margin-right: 15px;
        }
    </style>
</head>
<body>

    <header>
        <h1>Erik Malson | AI and Data Center Engineer</h1>
			<p class="contact-info">
				<a href="tel:202-684-6295">☎️</a> | 
				<a href="mailto:erikmalson+careerinquires@gmail.com">✉️</a> | 
				<a href="https://Erik.ml">🌐Erik.ml</a> | 
				<a href="https://linkedin.com/in/erikmalson" target="_blank">Linkedin</a> | 
				<a href="https://github.com/MyManErik" target="_blank">GitHub</a> | 
				You are visitor no. <span id="visitor-counter">...</span>
			</p>
    </header>

    <main>
        <div class="section">
            <h2>Professional Summary</h2>
            <p>
                A highly motivated and analytical professional with a Bachelor's degree in Information Technology and extensive, recent certifications in AI, Data Engineering, and Cloud Computing. Combines a foundational understanding of IT systems with cutting-edge expertise in the end-to-end machine learning lifecycle, from building data pipelines and creating intelligent automation to training and fine-tuning models. Eager to apply a deep knowledge of data analysis, model evaluation and server installation experience to enhance the accuracy and effectiveness of the AI and Data Center Solutions.
            </p>
        </div>

        <div class="section">
            <h2>Technical Skills</h2>
            <ul>
                <li><strong>AI & Data Science:</strong> AI Agents, AI Automation / Workflows, Data Curation, Deep Learning, Fine-Tuning, Large Language Models (LLM), Model Evaluation & Deployment, Natural Language Processing (NLP), Prompt Engineering, Sentiment Analysis, Text Classification</li>
                <li><strong>Data Engineering:</strong> Apache Airflow, Apache Flink, Apache Kafka, Apache Spark, Data Lakes, Data Warehousing, Databases, dbt, ETL Processes, Real-Time Pipelines, SQL</li>
                <li><strong>Frameworks & Libraries:</strong> HuggingFace, LangChain, NumPy, Pandas, PyTorch, Streamlit, TensorFlow</li>
                <li><strong>Cloud & Platforms:</strong> AWS (API Gateway, Bedrock, CloudFront, DynamoDB, Lambda, S3, SageMaker), CI/CD, Docker, Jupyter Notebooks, n8n, Python</li>
                <li><strong>Infrastructure & Project Management:</strong> Data Center Operations, Hardware Lifecycle Management, KPI Reporting, Stakeholder Management, Systems Consolidation, Vendor Management</li>
            </ul>
        </div>

        <div class="section projects-section">
            <h2>Projects</h2>
            <h3>Form Intake Webapp w/ Agentic AI Automated Workflows</h3>
            <ul>
                <li>Architected an intelligent form intake web application using n8n to create an AI-driven automated workflow, instantly answering 85% of user inquiries with a fine-tuned LLM.</li>
                <li>Implemented a "man-in-the-middle" agent to analyze and classify form data in real-time.</li>
                <li>Engineered an intelligent routing system that triaged the remaining 15% of complex inquiries, forwarding them with context to Sales and IT for clarification.</li>
            </ul>

            <h3>Conversational AI: Customer Intent Classification Model</h3>
            <ul>
                <li>Developed a system to classify customer support emails by intent, achieving 98% accuracy.</li>
                <li>Utilized Python and NLP, and curated a custom dataset of over 2,000 examples to train and validate the model.</li>
                <li>Demonstrates foundational capability in analyzing model outputs and refining data for continuous improvement.</li>
            </ul>

            <h3><a href="https://Erik.ml">🌐Erik.ml</a> | CI/CD Serverless Analytic Enabled Resume on AWS Cloud Stack aka Cloud Resume Challenge</h3>
            <ul>
                <li>Built and deployed a serverless, cloud-native resume website on AWS infra.</li>
                <li>Features a visitor counter powered by a serverless backend and is delivered globally with low latency via CDN.</li>
                <li><strong>Technologies:</strong> API Gateway, CloudFront, DynamoDB, GitHub Actions, Lambda, Route 53, S3, Terraform.</li>
            </ul>
        </div>

        <div class="section experience-section">
            <h2>Professional Experience</h2>
            <h3>AI Automation Specialist (Contract) <span>Remote | June 2025 – July 2025</span></h3>
            <ul>
                <li>Designed and deployed an AI-powered intake form using n8n, automating 85% of submissions.</li>
                <li>Implemented a "man-in-the-middle" workflow where a fine-tuned LLM intercepted, analyzed, and classified form data in real-time.</li>
                <li>Engineered an intelligent routing system for the remaining 15% of complex inquiries, forwarding them with context to appropriate teams.</li>
            </ul>

            <h3>Data Analyst (Contract) <span>Remote | March 2025 – May 2025</span></h3>
            <ul>
                <li>Analyzed chatbot interaction data, leading to a 15% improvement in response accuracy.</li>
                <li>Structured and refined large datasets for AI model training, reducing misclassification rates by 10%.</li>
                <li>Curated and annotated a custom dataset of over 2,000 real-world examples to train and validate an NLP model, achieving 98% classification accuracy.</li>
            </ul>
            
            <h3>Career Transition & Technical Training <span>AWS Skill Builder / Center, Per Scholas & Zero To Mastery | Jan 2024 - Mar 2025</span></h3>
            <ul>
                <li>Completed over 1,500 hours of intensive, hands-on training and project-based learning, focusing on a full-stack career pivot to AI, Data Engineering, and Cloud technologies.</li>
                <li>Developed comprehensive, production-level skills in the end-to-end machine learning lifecycle, from data pipeline construction to model deployment and fine-tuning.</li>
                <li>Gained expertise in modern cloud-native architectures, serverless computing, and Infrastructure as Code (IaC) principles.</li>
            </ul>

            <h3>Overnight Senior Front Desk Manager <span>YOTEL | May 2022 - Jul 2023</span></h3>
            <ul>
                <li>Coordinated seamless 24/7 operational hand-offs between overnight and daytime shifts, serving as the primary after-hours contact for all facility and operational issues.</li>
                <li>Managed daily transition briefings for senior management, providing comprehensive updates on overnight activities, emergent issues, and prioritized tasks to ensure continuity.</li>
                <li>Authored and presented Standard Operating Procedures (SOPs) to leadership, aimed at enhancing operational efficiency, team preparedness, and inter-shift coordination.</li>
            </ul>

            <h3>Floor Manager & Team Lead, VIP Lounge <span>MGM National Harbor | Jul 2016 - Apr 2020</span></h3>
            <ul>
                <li>Began as a high-performing associate, analyzing daily operational reports and auditing folios to increase customer satisfaction by 50% and financial performance by 15%.</li>
                <li>Promoted to Team Lead, managing and coaching VIP lounge staff, coordinating with all hotel departments to fulfill high-value guest requests, and overseeing daily inventory and purchasing.</li>
                <li>Leveraged prior digital marketing experience to manage a $1.2M budget, craft analytics reports on lounge performance for stakeholders, and manage key vendor relationships.</li>
            </ul>

            <h3>Project Manager <span>National Institutes of Health | Jun 2013 - Jan 2014</span></h3>
            <ul>
                <li>Architected and developed a custom Web 2.0 project management portal using PHP/MySQL to centralize project milestones, stakeholder documents, and communications.</li>
                <li>Engineered a mobile-friendly UX, enabling remote project management and access for stakeholders on mobile devices.</li>
                <li>Consolidated project documentation into a centralized, remotely accessible file server and trained stakeholders on the new system.</li>
            </ul>

            <h3>Project Manager, Web & Infrastructure <span>D.C. Government, Office of the CTO | Aug 2003 - Dec 2010</span></h3>
            <ul>
                <li>Led a metrics-driven overhaul of the DC.gov web portal, leveraging web analytics and user data to guide UI/UX improvements and report on KPIs to senior leadership.</li>
                <li>Achieved over $5M in cost savings by analyzing and consolidating redundant systems and infrastructure within the DC government's web infrastructure team.</li>
                <li>Managed critical infrastructure projects, including enterprise-level data backups across remote data centers, hardware/software rollouts, and the implementation of intranet search engines.</li>
            </ul>
            
            <h3>Server Engineer <span>Sun Microsystems | Vienna, VA | July 1995 - July 1998</span></h3>
            <ul>
                <li>Built, deployed, and maintained enterprise server infrastructure for major Fortune 500 clients, including America Online (AOL), Sprint, and Bell Atlantic/MCI (now Verizon).</li>
            </ul>

            <h3>Network Administrator <span>Howard University School of Business | Sep 1994 - May 1996</span></h3>
            <ul>
                <li>Led a student team in a campus-wide infrastructure modernization project, deploying and upgrading over 200 PCs.</li>
                <li>Engineered a streamlined PC imaging and software deployment process using Norton Ghost to ensure consistent configurations.</li>
            </ul>
        </div>

        <div class="section certifications-section">
            <h2>Certifications & Specialized Training</h2>
            <p><em>AI and Data Training via Zero To Mastery Academy (Continuous Learning)</em></p>
            
            <ul>
                <li class="cert-item">
                    <a href="https://www.credly.com/badges/de4d7157-22d3-4ab3-975d-b9a6555599ae/" target="_blank">
                        <img src="https://images.credly.com/size/220x220/images/00634f82-b07f-4bbd-a6bb-53de397fc3a6/image.png" alt="AWS Certified Cloud Practitioner Badge" class="cert-badge">
                    </a>
                    <div>
                        <strong>AWS Certified Cloud Practitioner</strong>, May 2024
                    </div>
                </li>
                <li>
                     <a href="https://www.certmetrics.com/comptia/public/verification.aspx?code=XM9JFRJTLFEF/3K2" target="_blank">
                        <strong>CompTIA A+</strong>, March 2024
                    </a>
                </li>
            </ul>
            <ul class="cert-list">
                <li><strong>Featured:</strong> AWS Bedrock, AWS SageMaker, Data Engineering & Big Data, Machine Learning & Data Science Bootcamp, Python for Data Science</li>
                <li><strong>AI:</strong> AI Agents with AWS, AI Automation / Workflows with n8n, Fine-Tuning & RAG for LLMs, GenAI with AWS Bedrock, PyTorch, TensorFlow</li>
                <li><strong>Cloud & Data:</strong> AWS Certified AI Practitioner (Pending Aug 2025)</li>
            </ul>
        </div>

        <div class="section">
            <h2>Education</h2>
            <h3>Bachelor of Business Administration (BBA), Information Technology</h3>
            <p>Howard University, Washington, D.C.</p>
        </div>
        
    </main>

    <script>
        // This script will run when the HTML page is fully loaded.
        window.addEventListener('DOMContentLoaded', (event) => {
            // Call the function to get the visitor count.
            getVisitorCount();
        });

        const getVisitorCount = () => {
            // The API endpoint URL from API Gateway.
			const apiUrl = '${api_url}/visitor-count';

            // Use the fetch API to make a GET request to our endpoint.
            fetch(apiUrl)
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.json();
                })
                .then(data => {
                    // Find the HTML element with the ID 'visitor-counter' and update its text.
                    document.getElementById('visitor-counter').innerText = data.visitor_count;
                })
                .catch(error => {
                    // If there's an error, log it to the console for debugging.
                    console.error('Error fetching visitor count:', error);
                    // Update the text to something user-friendly instead of an error message.
                    document.getElementById('visitor-counter').innerText = 'N/A';
                });
        }
    </script>

</body>
</html>

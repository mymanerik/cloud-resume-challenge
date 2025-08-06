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
                <li><strong>AI & Data Science:</strong> Sentiment Analysis, Text Classification, Natural Language Processing (NLP), Fine-Tuning, Prompt Engineering, Model Evaluation & Deployment, Data Curation, Large Language Models (LLM), AI Agents, Deep Learning</li>
                <li><strong>Data Engineering:</strong> Real-Time Pipelines (Apache Kafka, Flink), Data Lakes, ETL Processes, Data Warehousing, SQL, Databases, Apache Spark, Apache Airflow, dbt</li>
                <li><strong>Frameworks & Libraries:</strong> PyTorch, LangChain, HuggingFace, Pandas, NumPy, TensorFlow, Streamlit</li>
                <li><strong>Cloud & Platforms:</strong> AWS (SageMaker, Bedrock, S3, Lambda, API Gateway, CloudFront, DynamoDB), n8n, Jupyter Notebooks, Docker, Python, CI/CD</li>
                <li><strong>Infrastructure & Project Management:</strong> Hardware Lifecycle Management, Data Center Operations, Systems Consolidation, Vendor Management, KPI Reporting, Stakeholder Management</li>
            </ul>
        </div>

        <div class="section projects-section">
            <h2>Projects</h2>
            <h3>Form Intake Webapp w/ Agentic AI Automated Workflows (Available On Aug 6th, 2025)</h3>
            <ul>
                <li>Architected an intelligent form intake web application using n8n to create an AI-driven automated workflow, instantly answering 85% of user inquiries with a fine-tuned LLM.</li>
                <li>Implemented a "man-in-the-middle" agent to analyze and classify form data in real-time.</li>
                <li>Engineered an intelligent routing system that triaged the remaining 15% of complex inquiries, forwarding them with context to Sales and IT for clarification.</li>
            </ul>

            <h3>Conversational AI: Customer Intent Classification Model  (Available On Aug 6th, 2025)</h3>
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

            <h3>Project Manager <span>COMSYS (for D.C. Government) | Jan 2008 - Dec 2010</span></h3>
            <ul>
                <li>Led a metrics-driven overhaul of the DC.gov web portal, leveraging web analytics and user data to guide UI/UX improvements.</li>
                <li>Analyzed website document structures and user behavior to provide data-backed recommendations, enhancing performance.</li>
                <li>Orchestrated cross-functional teams, reporting on KPIs and project milestones to senior government leadership.</li>
            </ul>

            <h3>Asset & Special Projects Manager <span>D.C. Government, Office of the CTO | Aug 2003 - Sep 2006</span></h3>
            <ul>
                <li>Achieved over $5M in cost savings by analyzing and consolidating redundant systems and infrastructure.</li>
                <li>Managed critical infrastructure projects, including enterprise-level data backups across remote data centers and the implementation of Google and Ask Jeeves intranet search engines.</li>
                <li>Directed hardware/software rollouts and developed a secure extranet application, managing the full project lifecycle.</li>
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
            <p><em>(All training completed March 2025 from Zero To Mastery Academy)</em></p>
            
            <ul>
                <li class="cert-item">
                    <a href="https://www.credly.com/badges/de4d7157-22d3-4ab3-975d-b9a6555599ae/" target="_blank">
                        <img src="https://images.credly.com/size/220x220/images/00634f82-b07f-4bbd-a6bb-53de3975351b/image.png" alt="AWS Certified Cloud Practitioner Badge" class="cert-badge">
                    </a>
                    <div>
                        <strong>AWS Certified Cloud Practitioner</strong><br>
                        Issued: May 2024
                    </div>
                </li>
                <li class="cert-item">
                     <a href="https://www.certmetrics.com/comptia/public/verification.aspx?code=XM9JFRJTLFEQ13K2" target="_blank">
                        <img src="https://images.credly.com/size/220x220/images/a2790313-4a24-426a-a24b-05d852a353e4/CompTIA_A_2Bce.png" alt="CompTIA A+ Badge" class="cert-badge">
                    </a>
                    <div>
                        <strong>CompTIA A+</strong><br>
                        Issued: March 2024
                    </div>
                </li>
            </ul>
            <ul class="cert-list">
                <li><strong>Featured:</strong> Machine Learning & Data Science Bootcamp, Data Engineering & Big Data, AWS SageMaker, Python for Data Science</li>
                <li><strong>AI:</strong> Fine-Tuning & RAG for LLMs, GenAI with AWS Bedrock, AI Agents with AWS, PyTorch, TensorFlow</li>
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

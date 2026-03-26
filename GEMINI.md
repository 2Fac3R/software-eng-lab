# GEMINI.md - Project Context

## 1. User Information
- **Operating System:** linux
- **Working Directory:** `/home/genr/Documents/code/python/python-algorithms`
- **Date:** Thursday, March 26, 2026

## 2. Project Overview
The user's goal is to create a comprehensive, practical training plan for technical interviews, aiming for a "powerful level" in software engineering. The project is structured around **problem-solving techniques, design patterns, cloud certification, and senior-level role preparation (Python and Elixir)**.

Each topic within these modules contains components such as:
1.  **Theory:** Detailed explanations of concepts.
2.  **Challenges/Hands-On Labs:** Practical exercises or guided labs.
3.  **Solutions:** Optimal solutions for challenges or explanations for labs.
4.  **Exams:** Short evaluations or practice questions.
5.  **Cheatsheets:** Concise summaries for quick review.
6.  **Flashcards:** (New) For spaced repetition learning.

Additionally, the project contains a dynamic `index.html` for easy navigation and a guide on Prompt Engineering.

## 3. File Structure
The project is organized into several key modules:

```
/home/genr/Documents/code/python/python-algorithms/
├── GEMINI.md
├── index.html
├── README.md
├── training/
│   ├── fundamentals/
│   ├── techniques/
│   ├── challenges/
│   └── solutions/
├── design_patterns/
│   ├── theory/
│   ├── challenges/
│   ├── solutions/
│   ├── exams/
│   └── cheatsheets/
├── aws_cloud_practitioner/
│   ├── 00_introduction_to_aws.md
│   ├── 01_domain_cloud_concepts/
│   ├── 02_domain_security_and_compliance/
│   ├── 03_domain_cloud_technology/
│   ├── 04_domain_billing_and_support/
│   └── practice_exams/
├── elixir_senior_engineer_prep/
│   ├── 01_elixir_and_functional_programming/
│   ├── 02_distributed_systems_with_otp/
│   ├── 03_event_driven_architecture_kafka/
│   ├── 04_advanced_software_design/
│   ├── 05_relational_databases_and_ecto/
│   └── 06_technical_leadership_and_best_practices/
├── senior_software_engineer_prep/
│   ├── 01_advanced_python_and_quality_ecosystem/
│   ├── 02_advanced_software_architecture_ddd_and_clean_architecture/
│   ├── 03_postgresql_expertise/
│   ├── 04_quality_testing_and_cicd/
│   ├── 05_web_frameworks_django_and_fastapi/
│   └── 06_containerization_and_deployment/
├── js/
│   ├── content_fundamentals.json
│   ├── content_techniques.json
│   ├── content_design_patterns.json
│   ├── content_aws.json
│   ├── content_elixir.json
│   └── content_senior_software.json
├── exams/
├── cheatsheets/
└── prompt_engineering/
```

## 4. Key Logic & File Descriptions
- **`training/`**: Fundamentals and Problem-Solving Techniques.
- **`design_patterns/`**: 24 fundamental software design patterns.
- **`aws_cloud_practitioner/`**: AWS CLF-C02 study plan.
- **`elixir_senior_engineer_prep/`**: Specialized track for Senior Elixir roles, focusing on OTP, Kafka, and distributed systems.
- **`senior_software_engineer_prep/`**: Track for Senior Python/Infrastructure roles, focusing on DDD, Clean Architecture, and advanced PostgreSQL.
- **`js/`**: JSON data files for each module, used to dynamically build the `index.html` sidebar.
- **`index.html`**: A dynamic, single-page web interface that renders Markdown and various code files (Python, Elixir, SQL) with syntax highlighting.

## 5. User Preferences & Goals
- Mastering problem-solving patterns and high-level software engineering principles.
- All created documents must be in English.
- Iterative development and comprehensive validation.

## 6. Recent Activity
- Added two new specialized prep modules: **Elixir Senior Engineer** and **Senior Software Engineer (Python/Infrastructure)**.
- Generated `js/content_elixir.json` and `js/content_senior_software.json` to integrate these modules into the UI.
- Enhanced `index.html` to support rendering Elixir and SQL files, and updated the sidebar navigation for all 6 main modules.
- Updated `README.md` and `GEMINI.md` to reflect the expanded curriculum.
- Last action: Completed integration of senior engineering prep tracks into the main platform.

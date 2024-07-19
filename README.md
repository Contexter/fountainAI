# Road to FountainAI

## Introduction

Welcome to "FountainAI's Vapor," the story of setting up and deploying FountainAI, an AI-driven model designed to analyze and process theatrical and screenplay scripts. Leveraging the power of Vapor, Docker, and modern CI/CD practices, this guide will take you through every step, from initial setup to deploying a Dockerized Vapor application managed by a CI/CD pipeline.

### FountainAI Network Graph

The FountainAI Network Graph provides a visual overview of the conceptual model of FountainAI, highlighting the core components and their interactions. This graph helps visualize the structural and thematic composition of storytelling, providing a foundational understanding of how FountainAI will process and analyze scripts.

![The Fountain Network Graph](https://coach.benedikt-eickhoff.de/koken/storage/cache/images/000/723/Bild-2,xlarge.1713545956.jpeg)

### OpenAPI Specification

The OpenAPI specification serves as the detailed blueprint for FountainAI, transitioning from the high-level conceptual model to a precise API definition. It outlines all the endpoints, request/response formats, and data models, ensuring that developers have a clear and consistent reference for implementing the AI. The OpenAPI specification for this project can be found [here](https://github.com/Contexter/fountainAI/blob/main/openAPI/FountainAI-Admin-openAPI.yaml).

---

## Episode Overviews

### [Episode 1: Initial Setup and Manual GitHub Secrets Creation](episodes/Episode1/episode1.md)

In this episode, we set up the foundational components required for developing and deploying FountainAI. This includes creating a GitHub repository, configuring environment variables, and establishing secure communication with a VPS.

### [Episode 2: Creating and Managing the CI/CD Pipeline with GitHub Actions](episodes/Episode2/episode2.md)

In this episode, we create and manage a CI/CD pipeline using GitHub Actions. This pipeline automates the process of building, testing, and deploying the FountainAI application, ensuring continuous integration and continuous deployment.

### [Episode 3: Creating and Managing the Vapor App for FountainAI with CI/CD Pipeline](episodes/Episode3/episode3.md)

In this episode, we create a basic "Hello, World!" Vapor application, Dockerize it, and integrate it into the CI/CD pipeline established in Episode 2. We introduce Docker Compose to manage multiple containers and ensure a smooth deployment process.

### [Episode 4: Automating Secrets Management with a Swift Command-Line Tool](episodes/Episode4/episode4.md)

In this episode, we enhance our CI/CD pipeline by creating a Swift-based command-line tool to manage GitHub secrets. This tool is Dockerized and integrated into our CI/CD workflows, allowing for seamless and automated secrets management. This approach ensures better security, reduces manual effort, and maintains consistency across different environments.

### [Episode 5: Try or Die - Forcing the Monolith](episodes/Episode5/episode5.md)

In this turning point episode, we leverage GPT-4 to generate a full-stack Vapor application and an accompanying CI/CD pipeline. The GPT-4 model uses the provided OpenAPI specification to produce all necessary code components, streamlining our development workflow and enhancing productivity. Based on the test results, this episode marks a significant shift in our approach, highlighting both the potential and the limitations of using AI-driven code generation for complex applications.

### [Episode 6: Placeholder Title](episodes/Episode6/episode6.md)

Content to be added.

### [Episode 7: Placeholder Title](episodes/Episode7/episode7.md)

Content to be added.

### [Episode 8: Placeholder Title](episodes/Episode8/episode8.md)

Content to be added.

### [Episode 9: Placeholder Title](episodes/Episode9/episode9.md)

Content to be added.

### [Episode 10: Placeholder Title](episodes/Episode10/episode10.md)

Content to be added.
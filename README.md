# Template

## Directory Structure 

### Infrastructure
The infra/ directory contains files related to the infrastructure setup and configuration of the application.

Docker/: Contains the Dockerfile used for building Docker images of the application.

Kubernetes/: Contains Kubernetes deployment and service configurations.
deployment.yaml: Defines the deployment configuration for running the application on a Kubernetes cluster.

config/: Houses configuration files essential for the application's infrastructure. app_config.yaml: Configuration file containing settings specific to the application's infrastructure.

obj/: This directory stores Docker images that are generated during the CI (Continuous Integration) process and later used in the CD (Continuous Deployment) process.

### Application Components
The remaining directories house components and resources related to the application itself.

src/: Contains the source code of the application. app.py: Main application code responsible for defining the application's behavior. requirements.txt: File listing dependencies required for running the application.

tests/: Contains both unit and integration tests for the application. unit/: Contains unit test files ensuring individual components of the application work correctly. integration/: Contains integration test files validating interactions between different components of the application.

docs/: Holds documentation files providing information about the application and its components.
README.md: Readme file offering detailed information about the application's structure and usage.

config/: Contains configuration files essential for the application's operation. database_config.yaml: Configuration file specifying database connection settings used by the application.

## Build Script (build.sh)
Overview
This GitHub Actions workflow automates the process of building and publishing a Docker image to GitHub Packages. The workflow is triggered when a pull request is made to the "release" branch in your repository. Initially, the code is checked out, and the Python environment is set up. Then, the PyYAML package is installed to parse YAML files, specifically to read configuration settings from app_config.yaml.

Once set up, the workflow reads the Docker image name from the configuration file and builds the Docker image using the specified Dockerfile. It logs into the GitHub Packages Docker registry using a personal access token and publishes the built Docker image to the registry.

This workflow expects a Dockerfile in your project structure as well as a configuration file specifying settings for the Docker image. By integrating this workflow into your project, you can automate the build and publish process of your Docker image each time a change is made in the "release" branch.

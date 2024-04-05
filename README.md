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

config/: Contains configuration files essential for the application's operation.

database_config.yaml: Configuration file specifying database connection settings used by the application.



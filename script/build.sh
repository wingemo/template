#!/bin/bash

# CI script for building the application Docker image

set -e  # Exit immediately if a command exits with a non-zero status
set -u  # Treat unset variables as an error when substituting

# Define variables
readonly APP_CONFIG="Infrastructure/config/app_config.yaml"
readonly DOCKERFILE_PATH="Infrastructure/Docker/Dockerfile"
readonly OBJ_DIRECTORY="Infrastructure/obj"
DOCKER_IMAGE_NAME=""

# Extract Docker image name from app_config.yaml
DOCKER_IMAGE_NAME=$(python - <<END
import yaml
try:
    with open('$APP_CONFIG', 'r') as config_file:
        config = yaml.safe_load(config_file)
        docker_image_name = config.get('docker_image_name', 'default_image_name')
        if not docker_image_name:
            raise ValueError("Docker image name is not defined in app_config.yaml")
        print(docker_image_name)
except FileNotFoundError:
    print('Error: app_config.yaml not found.')
    exit 1
except yaml.YAMLError:
    print('Error: Invalid YAML format in app_config.yaml.')
    exit 1
except ValueError as e:
    print(f"Error: {str(e)}")
    exit 1
END
)

# Build Docker image
echo "Building Docker image..."
docker build -t "$DOCKER_IMAGE_NAME" -f "$DOCKERFILE_PATH" .

# Check if Docker image was built successfully
if [ $? -ne 0 ]; then
    echo "Error: Failed to build Docker image."
    exit 1
fi

# Move Docker image to obj directory
echo "Moving Docker image to obj directory..."
docker image tag "$DOCKER_IMAGE_NAME" "$OBJ_DIRECTORY/$DOCKER_IMAGE_NAME"

# Check if Docker image was tagged and moved successfully
if [ $? -ne 0 ]; then
    echo "Error: Failed to tag and move Docker image to obj directory."
    exit 1
fi

echo "Docker image build and move completed successfully."

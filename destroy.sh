#!/bin/bash

# Variables
REGION="eu-central-1"
REPOSITORY_NAME="nodejs-app"
# End Variables

# delete all Docker-img from ECR
echo "--------------------Deleting ECR-IMG--------------------"
./ecr-img-delete.sh $REGION $REPOSITORY_NAME

# delete AWS resources
echo "--------------------Deleting AWS Resources--------------------"
cd terraform && \
terraform destroy -auto-approve

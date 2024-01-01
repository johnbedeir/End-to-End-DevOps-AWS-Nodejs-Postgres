#!/bin/bash

# Variables
REGION="REGION" #Make sure it is the same in the terraform variables
REPOSITORY_NAME="nodejs-app"
BUCKET_NAME=$(cd terraform && terraform output --raw bucket_name)
# End Variables

# empty the ecr
echo "--------------------Empty AWS ECR--------------------"
./ecr-img-delete.sh $REGION $REPOSITORY_NAME

# delete AWS resources
echo "--------------------Deleting AWS Resources--------------------"
cd terraform && \
terraform destroy -auto-approve

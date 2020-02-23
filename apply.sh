#!/usr/bin/env bash
set -e

ENVIRONMENT=$1
if [ -z "$ENVIRONMENT" ]
  then
    echo "No environment name supplied"
    exit 1
fi
DEPLOY_TIME=$(date)

echo "Deploying environment $ENVIRONMENT"

echo "Injecting env vars"
sed 's/!!!ENVIRONMENT!!!/'"$ENVIRONMENT"'/g; s/!!!DEPLOY_TIME!!!/'"$DEPLOY_TIME"'/g' index.template.html > $ENVIRONMENT.index.html

echo "Applying Terraform "
terraform init
# Select or create the Terraform workspace
terraform workspace select $ENVIRONMENT || terraform workspace new $ENVIRONMENT
terraform apply


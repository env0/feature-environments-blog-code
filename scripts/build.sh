#!/usr/bin/env bash
set -e

if [ -z "$ENV0_WORKSPACE_NAME" ]
  then
    echo "No environment name supplied"
    exit 1
fi
DEPLOY_TIME=$(date)

echo "Deploying environment $ENV0_WORKSPACE_NAME"

echo "Injecting env vars"
sed 's/!!!ENVIRONMENT!!!/'"$ENV0_WORKSPACE_NAME"'/g; s/!!!DEPLOY_TIME!!!/'"$DEPLOY_TIME"'/g' index.template.html > $ENV0_WORKSPACE_NAME.index.html

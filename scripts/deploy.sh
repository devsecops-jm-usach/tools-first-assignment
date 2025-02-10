#!/bin/bash

# Variables
APPLICATION_NAME="my-application"
DEPLOYMENT_GROUP_NAME="my-deployment-group"
S3_BUCKET="my-s3-bucket"
S3_KEY="myapp.zip"
BUNDLE_TYPE="zip"

# Empaquetar la aplicación
zip -r myapp.zip .

# Subir el paquete a S3
aws s3 cp myapp.zip s3://$S3_BUCKET/$S3_KEY

# Crear despliegue en CodeDeploy
aws deploy create-deployment \
  --application-name $APPLICATION_NAME \
  --deployment-group-name $DEPLOYMENT_GROUP_NAME \
  --s3-location bucket=$S3_BUCKET,key=$S3_KEY,bundleType=$BUNDLE_TYPE
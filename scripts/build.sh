#!/bin/bash

# Fail fast
set -e

build_folder=$1
ecr_repository_url=$2
image_tag_mutability=$3
region=$4

UUID=$(openssl rand -base64 8 |md5 |head -c8;echo)

echo "Verify if local aws cli is installed"
which aws > /dev/null || { echo 'ERROR: aws-cli is not installed' ; exit 1; }

echo "Verify if docker is installed & running"
which docker > /dev/null && docker ps > /dev/null || { echo 'ERROR: docker is not running' ; exit 1; }

echo "Connect to aws"
echo docker login -u AWS -p $(aws ecr get-login-password --region $region) "$ecr_repository_url"
docker login -u AWS -p $(aws ecr get-login-password --region $region) "$ecr_repository_url"

echo "Running $ecr_repository_url from $build_folder/Dockerfile"

echo "Build image"
docker build -t "$ecr_repository_url" "$build_folder"

echo "Tag with random string generated"
docker tag "$ecr_repository_url" "$ecr_repository_url":"$UUID"

# only tag with latest if images are mutable
if [ "$image_tag_mutability" == "MUTABLE" ]; then
  echo "Push image (latest and random tag generated)"
  docker push "$ecr_repository_url":latest
  docker push "$ecr_repository_url":"$UUID"
else
  echo "Push image (latest)"
  docker push "$ecr_repository_url":"$UUID"
fi

#!/bin/sh
set -e

USERNAME=$1
PASSWORD=$2
REPOSITORY=$3
REGISTRY=$4
TAG=$5
VERSION=$6

if [ -z $USERNAME ]; then
  echo 'Required username'
  exit 1
fi

if [ -z $PASSWORD ]; then
  echo 'Required password'
  exit 1
fi

if [ -z $REPOSITORY ]; then
  echo 'Required repository'
  exit 1
fi

if [ -z $TAG ]; then
  echo 'Required tag'
  exit 1
fi

if [ -z $VERSION ]; then
  $VERSION=0.0.0
  echo 'No version'
fi

IMAGE=$REPOSITORY:$TAG
if [ -n "$REGISTRY" ]; then
  IMAGE=$REGISTRY/$IMAGE
fi

docker build --build-arg SERVICE_VERSION=$VERSION -t $IMAGE .
docker login --username "$USERNAME" --password "$PASSWORD" $REGISTRY
docker push $IMAGE

echo ::set-output name=image::$IMAGE

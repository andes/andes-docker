#!/bin/bash

BRANCH=$1
API_BRANCH=$BRANCH
APP_BRANCH=$BRANCH

WORKDIR=$(pwd)
API_FOLDER=$WORKDIR/.build/api
APP_FOLDER=$WORKDIR/.build/app
VAPP_FOLDER=$WORKDIR/.build/vapp

if [ -z "$2" ]
then
    echo "APP_BRANCH=$API_BRANCH"
else
    APP_BRANCH=$2
    echo "APP_BRANCH=$API_BRANCH"
fi

./checkout.sh api $API_BRANCH
./checkout.sh app $APP_BRANCH
./checkout.sh vapp master

echo "Done!"
set -x

cd $API_FOLDER
docker build -t andesnqn/api:$API_BRANCH .

cd $APP_FOLDER
docker build -t andesnqn/app:$APP_BRANCH .

cd $VAPP_FOLDER
docker build -t andesnqn/vapp --build-arg API_VERSION=$API_BRANCH --build-arg APP_VERSION=$APP_BRANCH .

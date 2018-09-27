#!/bin/bash

BRANCH=$1
API_BRANCH=$BRANCH
APP_BRANCH=$BRANCH

WORKDIR=$(pwd)
API_FOLDER=$WORKDIR/.build/api
APP_FOLDER=$WORKDIR/.build/app

if [ -z "$2" ]
then
    echo "APP_BRANCH=$API_BRANCH"
else
    APP_BRANCH=$2
    echo "APP_BRANCH=$API_BRANCH"
fi



./checkout.sh api $API_BRANCH
./checkout.sh app $APP_BRANCH

echo "Done!"
set -x

cd API_FOLDER
docker build -t andesnqn/api:$API_BRANCH .

cd APP_FOLDER
docker build -t andesnqn/app:$APP_BRANCH .

# cd vapp
# docker build -t andesnqn/vapp

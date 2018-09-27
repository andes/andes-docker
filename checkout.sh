#!/bin/bash

APPLICATION=$1
ANDES_BRANCH=$2

WORKDIR=$(pwd)
FOLDER="$WORKDIR/.build/$APPLICATION"

ANDES_REPOSITORY_URL="https://github.com/andes/$APPLICATION"


if [ -e "$FOLDER/.git" ]
then
  cd $FOLDER
  git remote set-url origin "$ANDES_REPOSITORY_URL" || true
else
  mkdir -p $FOLDER
  cd $FOLDER
  git clone "$ANDES_REPOSITORY_URL" .
fi

if [ -n "$CIRCLE_TAG" ]
then
  git fetch --force origin "refs/tags/${CIRCLE_TAG}"
else
  git fetch --force origin "$ANDES_BRANCH:remotes/origin/$ANDES_BRANCH"
fi

if [ -n "$CIRCLE_TAG" ]
then
  #git reset --hard "$CIRCLE_SHA1"

# git reset --hard "$CIRCLE_SHA1"
  git checkout -q "$CIRCLE_TAG"
elif [ -n "$ANDES_BRANCH" ]
then
  git reset --hard HEAD
  git checkout origin/"$ANDES_BRANCH"
fi
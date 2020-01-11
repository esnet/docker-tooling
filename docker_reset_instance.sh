#!/usr/bin/env bash
set -e

if [ $# -eq 1 ]
then
  CONTAINER_NAME=$1
else
  echo "Usage: `basename $0` image_name"
  echo -e "\nwill stop and reset the docker machine to the initial state."
  echo -e "This needs to be executed from within the directory containing your docker-compose.yml file."
  exit 0
fi


docker-compose stop $CONTAINER_NAME; docker-compose up --force-recreate --no-deps -d $CONTAINER_NAME

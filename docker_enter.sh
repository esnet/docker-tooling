#!/usr/bin/env bash 
id=$(docker ps -a | grep $1 | awk '{print $1}' )

docker exec -it $id sh

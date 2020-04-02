#!/usr/bin/env bash

echo "stopping and removing all containers"
for item in $(docker ps -aq); do
    docker stop $item
    docker rm $item
done

echo "removing all images without tags "
for item in $(docker images --filter dangling=true -q); do
    docker rmi $item
done

echo "removing all volumes"
for item in $(docker volume ls -f dangling=true -q); do
    docker volume rm $item
done


echo "removing all networks"
for item in $(docker network ls -f dangling=true -q); do
    docker network rm $item
done


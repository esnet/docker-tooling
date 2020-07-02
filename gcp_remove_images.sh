#!/usr/bin/env bash


if [ $# -eq 1 ]
then
  IMAGE_NAME=$1
else
  echo "Usage: `basename $0` image_name"
  echo -e "\nwill remove and delete all tags under the given image."
  echo -e "Warning: this should only be used on the develop project"
  exit 0
fi

#Validate gcloud is setup
if ! command -v gcloud  &> /dev/null
then
    echo "gcloud could not be found"
    exit
fi

current=$(gcloud config list --format 'value(core.project)' 2>/dev/null)

read -p "The current project is set to $current, do you wish to proceed (Y/N)? " -n 1 -r
echo ""

if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo "Goodbye!" 
    exit 1
fi


read -p "exclude semantic version numbers ie. 1.0.5    (Y/N)? " -n 1 -r
echo ""
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    regex=""
else
    regex="|([0-9]+)\.([0-9]+)\.([0-9]+)"
fi


for i in $( gcloud container images list-tags gcr.io/$current/$IMAGE_NAME   | awk '{print $2}' | egrep -ve "TAGS$regex"  | tr ',' '\n')  
do 
    yes | gcloud container images delete gcr.io/$current/$IMAGE_NAME:$i ; 
done

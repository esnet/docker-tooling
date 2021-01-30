#!/bin/bash
set -e
 
# Use bash if no command is specified
if [ $# -lt 1 ]
then
  echo "Usage: `basename $0` container_name [namespace]"
  echo -e "\nWill enter a k8 pod, namespace is optional default is 'default' "
  exit 0
else
  CONTAINER=$1
  shift 
fi

## Sets namespace
if [ $# -gt 0 ]; then
  NAMESPACE=$1
  shift
else
    NAMESPACE='default'
fi 
 
kubectl -n $NAMESPACE exec -it $(kubectl -n $NAMESPACE get pods | grep $CONTAINER  | sed -e 's/ .*//'   )   -- "$@" bash


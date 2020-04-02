#!/bin/bash
set -e
 
# Use bash if no command is specified
if [ $# -lt 1 ]
then
  echo "Usage: `basename $0` container_name cli arguments"
  echo -e "\nLists the currently forwarded ports for a specific machine"
  exit 0
else
  CONTAINER=$1
  shift 
fi
 
kubectl exec -it $(kubectl get pods | grep $CONTAINER  | sed -e 's/ .*//'   )   -- "$@" bash


#!/bin/bash
set -e
 
# Use bash if no command is specified
if [ $# -lt 1 ]
then
  echo "Usage: `basename $0` namespace"
  echo -e "\nGives a shell on active context for specified namesapce"
  exit 0
else
  NAMESPACE=$1
  shift
fi
 
kubectl -n $NAMESPACE run curl --image=radial/busyboxplus:curl -i --tty


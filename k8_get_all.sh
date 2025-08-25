#!/usr/bin/env bash
set -euo pipefail

# Colors
MAGENTA="\033[35m"
CYAN="\033[36m"
RESET="\033[0m"

# Check if a namespace argument was provided
if [[ $# -lt 1 ]]; then
	echo "Usage: $0 <namespace>"
	exit 1
fi

NAMESPACE="$1"

# Loop through all namespaced resources
kubectl api-resources --namespaced --verbs=list -o name |
	while read -r res; do
		output=$(kubectl get "$res" -n "$NAMESPACE" --ignore-not-found --show-kind --no-headers=false 2>/dev/null || true)
		if [[ -n "$output" ]]; then
			echo -e "\n${MAGENTA}=== $res ===${RESET}"
			echo "$output" |
				awk -v cyan="$CYAN" -v reset="$RESET" 'NR==1 {print; next} {sub($1, cyan $1 reset); print}'
		fi
	done

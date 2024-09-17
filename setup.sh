#!/bin/bash

# File path to the repo configuration
REPO_FILE="/etc/yum.repos.d/redhat-rhui.repo"

# Repository to be modified
REPO_NAME="rhel-7-server-rhui-extras-rpms"

# Check if the repository file exists
if [ -f "$REPO_FILE" ]; then
  # Use sed to find the specific repo and set 'enabled=1'
  sed -i "/\[$REPO_NAME\]/,/^$/s/enabled=.*/enabled=1/" "$REPO_FILE"

  echo "Repository '$REPO_NAME' has been enabled."
else
  echo "Repository file '$REPO_FILE' not found!"
  exit 1
fi

sudo yum -y install ansible git

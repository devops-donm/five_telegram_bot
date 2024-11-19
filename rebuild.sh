#!/bin/bash

# Define repository name and URL
REPO_NAME="zero_ansible_server"
REPO_URL="https://github.com/devops-donm/zero_ansible_server.git"

# Check if the repository directory exists
if [ -d "$REPO_NAME" ]; then
    echo "Directory '$REPO_NAME' exists. Removing it..."
    rm -rf "$REPO_NAME"
fi

# Clone the repository
echo "Cloning repository '$REPO_URL'..."
git clone "$REPO_URL"

# Navigate into the repository directory
cd "$REPO_NAME" || { echo "Failed to enter directory '$REPO_NAME'"; exit 1; }

# Run the Ansible playbooks
echo "Running Ansible playbooks..."
ansible-playbook playbooks/srv_harden.yml
ansible-playbook playbooks/nginx_container.yml
ansible-playbook playbooks/sample_django_project_container.yml

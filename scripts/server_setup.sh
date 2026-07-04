#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e 

echo "Starting server setup and configuration..."

# Update package manager and install necessary tools
sudo apt-get update -y
sudo apt-get install -y curl unzip tar

# Install Docker (if not present)
if ! command -v docker &> /dev/null
then
    echo "Docker not found. Installing Docker..."
    sudo apt-get install -y docker.io
    sudo systemctl start docker
    sudo systemctl enable docker
else
    echo "Docker is already installed."
fi

# Create a backup of the current application state
BACKUP_DIR="/var/backups/webapp"
sudo mkdir -p $BACKUP_DIR
TAR_NAME="webapp_backup_$(date +%Y%m%d_%H%M%S).tar.gz"

echo "Creating application backup..."
tar -czvf $BACKUP_DIR/$TAR_NAME ../app.py ../requirements.txt

echo "Setup and backup complete!"
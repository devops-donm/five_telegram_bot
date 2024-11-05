#!/bin/bash

# Directory paths
AVAILABLE_DIR="/etc/nginx/sites-available"
ENABLED_DIR="/etc/nginx/sites-enabled"

# Create symbolic links for each file in sites-available to sites-enabled
for file in "$AVAILABLE_DIR"/*; do
    # Extract just the filename from the path
    filename=$(basename "$file")
    
    # Create the symbolic link
    ln -s "$AVAILABLE_DIR/$filename" "$ENABLED_DIR/$filename"
done

# Print success message
echo "Symbolic links created for all configuration files in sites-available."

#!/bin/bash

# Download the smaller static pandoc binary for Linux (should be ~21MB like macOS version)
wget https://github.com/jgm/pandoc/releases/download/3.5/pandoc-3.5-linux-amd64.tar.gz
tar xvzf pandoc-3.5-linux-amd64.tar.gz
export PATH="$PWD/pandoc-3.5/bin:$PATH"

# Test pandoc installation
pandoc --version

# Process markdown files
for file in *.md; do
    if [ -f "$file" ] && [ "$file" != "README.md" ] && [ "$file" != "CONTRIBUTING.md" ] && [ "$file" != "LICENSE.md" ]; then
        echo "Processing $file..."
        pandoc "$file" -f markdown+yaml_metadata_block -t revealjs -o "${file%.md}.html" --standalone
    fi
done

# Run npm build
npm install
npm run build --if-present

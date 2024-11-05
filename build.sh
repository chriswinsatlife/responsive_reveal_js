#!/bin/bash

# Install a minimal pandoc using the binary directly
wget https://github.com/jgm/pandoc/releases/download/3.1.10/pandoc-3.1.10-linux-amd64.tar.gz
tar xvzf pandoc-3.1.10-linux-amd64.tar.gz
export PATH="$PWD/pandoc-3.1.10/bin:$PATH"

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

#!/bin/bash

# Install Pandoc using the correct version
PANDOC_VERSION="3.5"
wget "https://github.com/jgm/pandoc/releases/download/${PANDOC_VERSION}/pandoc-${PANDOC_VERSION}-linux-amd64.tar.gz"
tar xvzf pandoc-${PANDOC_VERSION}-linux-amd64.tar.gz
export PATH="$PWD/pandoc-${PANDOC_VERSION}/bin:$PATH"
pandoc --version

# Run normal build command
npm install
npm run build --if-present

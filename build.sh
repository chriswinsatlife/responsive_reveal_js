#!/bin/bash

# Install Pandoc using the latest version
PANDOC_VERSION="3.1.9"  # This is the latest stable version as of November 2024
wget "https://github.com/jgm/pandoc/releases/download/${PANDOC_VERSION}/pandoc-${PANDOC_VERSION}-linux-amd64.deb"
dpkg -x pandoc-${PANDOC_VERSION}-linux-amd64.deb pandoc-temp
export PATH="$PWD/pandoc-temp/usr/bin:$PATH"
pandoc --version

# Run normal build command
npm install
npm run build --if-present

#!/bin/bash

# Install Pandoc using a smaller binary download
PANDOC_VERSION="3.1.11"
wget "https://github.com/jgm/pandoc/releases/download/${PANDOC_VERSION}/pandoc-${PANDOC_VERSION}-linux-amd64.deb"
dpkg -x pandoc-${PANDOC_VERSION}-linux-amd64.deb pandoc-temp
export PATH="$PWD/pandoc-temp/usr/bin:$PATH"
pandoc --version

# Run normal build command
npm install
npm run build --if-present

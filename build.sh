#!/bin/bash

# Download and install a minimal quarto
QUARTO_VERSION="1.6.32"
wget -q https://github.com/quarto-dev/quarto-cli/releases/download/v${QUARTO_VERSION}/quarto-${QUARTO_VERSION}-linux-amd64.deb
dpkg -x quarto-${QUARTO_VERSION}-linux-amd64.deb ./quarto-temp
export PATH="$PWD/quarto-temp/usr/local/bin:$PATH"
quarto --version

# Process markdown files with Quarto
quarto render ai_slides.md -t revealjs

# Run normal build
npm install
npm run build --if-present

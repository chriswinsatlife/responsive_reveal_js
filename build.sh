#!/bin/bash

# Install Pandoc
curl -LO https://github.com/jgm/pandoc/releases/download/3.1.11/pandoc-3.1.11-linux-amd64.tar.gz
tar xvzf pandoc-3.1.11-linux-amd64.tar.gz
sudo mv pandoc-3.1.11/bin/pandoc /usr/local/bin/
pandoc --version

# Install Quarto
curl -LO https://github.com/quarto-dev/quarto-cli/releases/download/v1.4.549/quarto-1.4.549-linux-amd64.tar.gz
tar xvzf quarto-1.4.549-linux-amd64.tar.gz
sudo mv quarto-1.4.549 /opt/quarto
ln -s /opt/quarto/bin/quarto /usr/local/bin/quarto
quarto --version

# Then run your normal build command
npm install
npm run build --if-present  # or whatever your build command is

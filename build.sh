#!/bin/bash

# Process markdown files with Quarto
quarto render ai_slides.md -t revealjs

# Run normal build
npm install
npm run build --if-present

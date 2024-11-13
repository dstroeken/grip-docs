#!/bin/sh

# Change current directory to misc directory so it can be called from everywhere
SCRIPT_PATH=$(readlink -f "${0}")
SCRIPT_DIR=$(dirname "${SCRIPT_PATH}")

cd ..
npm run docs:build

cd docs/.vitepress/dist
tree -I 'assets' | grep -v -E '^(.*[^w])?\.html$'

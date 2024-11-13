#!/bin/sh

# Change current directory to misc directory so it can be called from everywhe>
SCRIPT_PATH=$(readlink -f "${0}")
SCRIPT_DIR=$(dirname "${SCRIPT_PATH}")

cd ..
npm run docs:build
npm run docs:preview -- --host --port 24173

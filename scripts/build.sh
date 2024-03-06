#!/bin/bash

USER="$1"
KEY="$2"

echo "Running the build script"

npm ci
npm install @forge/cli --no-optional
npm forge settings set usage-analytics false

cd static/hello-world
npm ci
npm run build
cd ../..

npx forge login -u $USER -t $KEY --non-interactive --verbose
npx forge whoami # debuggin'
npx forge deploy -e development

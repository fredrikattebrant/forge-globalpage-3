#!/bin/bash
set -xv 
USER="$1"
KEY="$2"

echo "---"
echo "Running the build script"
echo "---"

npm ci
npm install @forge/cli --omit=optional
npm forge settings set usage-analytics false

cd static/hello-world
npm ci
npm run build
cd ../..

echo "---"
echo "About to deploy with forge:"
echo "---"

npx forge login -u ${USER} -t ${KEY} --non-interactive --verbose
npx forge whoami # debuggin'
npx forge deploy -e development

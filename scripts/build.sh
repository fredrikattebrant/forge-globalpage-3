#!/bin/bash
set -xv

# Use environment instead of 'forge login' as we can't use the system keychain
export FORGE_EMAIL="$1"
export FORGE_API_TOKEN="$2"

echo "---"
echo "Running the build script"
echo "---"

npm ci
npm install @forge/cli --omit=optional
npx forge settings set usage-analytics false

cd static/hello-world
npm ci
npm run build
cd ../..

echo "---"
echo "About to deploy with forge:"
echo "---"

#npx forge login -u ${USER} -t ${KEY} --non-interactive --verbose

npx forge whoami # debuggin'
npx forge deploy -e development

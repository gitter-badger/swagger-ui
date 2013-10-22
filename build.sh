#!/bin/sh

set -e

(cd ../swagger.js/ && npm install && npm run-script build)

npm install

# update swagger client
npm install ../swagger.js

npm run-script build

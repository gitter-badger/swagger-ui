#!/bin/sh

set -e

(cd ../swagger.js/ && npm run-script build)

# update swagger client
npm install ../swagger.js

npm run-script build

rsync -av --delete --exclude "*~" dist/* tools@tools.test.medvision360.org:tools/current/public/apidocs

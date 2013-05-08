#!/bin/sh

set -e

(cd ../swagger.js/ && npm install && npm run-script build)

npm install

# update swagger client
npm install ../swagger.js

npm run-script build

rsync -av --exclude "*~" --exclude "#*" src/main/html/.htaccess dist/* tools@tools.test.medvision360.org:tools/current/public/apidocs

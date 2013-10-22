#!/bin/sh

set -e

./build.sh

rsync -av --exclude "*~" --exclude "#*" src/main/html/.htaccess dist/* tools@tools.test.medvision360.org:tools/current/public/apidocs
rsync -av --exclude "*~" --exclude "#*" src/main/html/.htaccess tools@tools.test.medvision360.org:tools/current/public

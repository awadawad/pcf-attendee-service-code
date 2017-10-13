#!/bin/bash

set -xe

cat ./current-app-info/current-app.txt

sed "s/APPNAME/$CF_APP_PREFIX-$(cat ./current-app-info/next-app.txt)/" ./attendee-service-source/manifests/manifest.yml > ./app-manifest-output/manifest.yml

cat ./app-manifest-output/manifest.yml

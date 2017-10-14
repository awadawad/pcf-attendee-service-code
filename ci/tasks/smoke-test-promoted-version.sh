#!/bin/bash

set -ex

export ATTENDEE_SERVICE_URL=http://main-$CF_APP_PREFIX.$CF_APP_DOMAIN/

echo "Installing CURL"
apt-get update && apt-get install -y curl

pushd attendee-service-source
  echo "Running smoke tests for promoted version Attendee Service deployed at $ATTENDEE_SERVICE_URL"
  smoke-tests/bin/test $ATTENDEE_SERVICE_URL
popd

exit 0
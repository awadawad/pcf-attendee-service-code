#!/bin/bash

set -ex

export NEXT_APP_COLOR=$(cat ./current-app-info/next-app.txt)
export ATTENDEE_SERVICE_URL=http://$CF_APP_PREFIX-$NEXT_APP_COLOR.$CF_APP_DOMAIN/

echo "Installing CURL"
apt-get update && apt-get install -y curl

pushd attendee-service-source
  echo "Running smoke tests for Attendee Service deployed at $ATTENDEE_SERVICE_URL"
  smoke-tests/bin/test $ATTENDEE_SERVICE_URL
popd

exit 0
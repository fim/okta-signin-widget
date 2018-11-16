#!/bin/bash

cd ${OKTA_HOME}/${REPO}

# Install required dependencies
npm install -g @okta/ci-update-package
npm install -g @okta/ci-pkginfo

if ! npm install --no-optional --unsafe-perm; then
  echo "npm install failed! Exiting..."
  exit ${FAILED_SETUP}
fi

if ! npm run build:release; then
  echo "npm build release failed! Exiting..."
  exit ${FAILED_SETUP}
fi

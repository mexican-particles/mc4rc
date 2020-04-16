#!/bin/bash

set -Cuex

if [[ -d /tmp/csr ]];then
  envsubst '$$VALIDATOR_FILE_NAME$$VALIDATOR_PATH$$FQDN' < /tmp/csr/http.tmp.conf > /etc/nginx/conf.d/http.conf

  rm -rf /tmp/csr
fi

nginx -g 'daemon off;'

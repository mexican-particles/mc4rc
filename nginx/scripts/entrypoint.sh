#!/bin/bash

set -Cuex

if [[ -d /tmp/csr ]];then
  mkdir /root/.ssl

  cp -p /tmp/csr/certification/fullchain.pem /root/.ssl/
  cp -p /tmp/csr/certification/private.pem /root/.ssl/
  cp -p /tmp/csr/certification/dhparam.pem /root/.ssl/

  envsubst '$$VALIDATOR_FILE_NAME$$VALIDATOR_PATH$$FQDN' < /tmp/csr/ssl.tmp.conf > /etc/nginx/conf.d/ssl.conf

  rm -rf /tmp/csr
fi

nginx -g 'daemon off;'

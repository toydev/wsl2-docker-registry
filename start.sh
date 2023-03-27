#!/bin/bash

source docker_registry.conf

mkdir -p certs
mkcert -install
cp  $(mkcert -CAROOT)/rootCA.pem certs/ca.crt
mkcert -cert-file certs/registry.crt -key-file certs/registry.key $DOCKER_REGISTRY_DOMAINS

docker compose up -d

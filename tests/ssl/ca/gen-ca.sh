#!/bin/sh
set -ex

# Create a private key
openssl genrsa -out ca.key 2048

# Create a certificate
openssl req -x509 -new -nodes -key ca.key -sha256 -days 3650 -config ca.cnf -out ca.crt

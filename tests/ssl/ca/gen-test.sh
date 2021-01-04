#!/bin/sh
set -ex

# Adapted from:
# http://nodejs.org/api/tls.html
# https://github.com/joyent/node/blob/master/test/fixtures/keys/Makefile

# Create a private key
openssl genrsa -out test.key 2048

# Create a certificate signing request
openssl req -new -sha256 -key test.key -out test.csr -config test.cnf -days 1095

# Use the CSR and the CA key (previously generated) to create a certificate
openssl x509 -req \
    -in test.csr \
    -CA ca.crt \
    -CAkey ca.key \
    -set_serial 0x`cat ca.srl` \
    -passin 'pass:password' \
    -out test.crt \
    -days 1095

# Encrypt with password
openssl rsa -aes128 -in test.key -out test-enc.key -passout 'pass:password'

#!/usr/bin/env bash

set -e

if [ ! -f "$1" ]; then
    echo "Necessário informar o arquivo PFX"
    exit 1
fi

if [ "$1" = "" ]; then
    echo "Necessário informar a senha"
    exit 1
fi

out=$(basename -s.pfx "$1")

openssl pkcs12 -in "$1" -passin stdin -nocerts -nodes -out "${out}-cert.pem" <<< "$2"
openssl pkcs12 -in "$1" -passin stdin -clcerts -nokeys -out "${out}-key.pem" <<< "$2"

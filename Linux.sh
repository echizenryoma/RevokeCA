#!/bin/bash

mkdir -p /etc/ca-certificates/trust-source/blocklist
crt_files=$(ls -1 ./crt/*)
for crt_file in ${crt_files}
do
    cer_name="$(basename ${crt_file})"
    pem_name="${cer_name%%.*}.pem"
    openssl x509 -inform der -in "$ca_file" -outform pem > /etc/ca-certificates/trust-source/blocklist/pem_name
done

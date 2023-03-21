#!/bin/bash

base_dir=$(realpath $(dirname $0))
mkdir -p "/etc/ca-certificates/trust-source/blocklist"
crt_files=$(ls -1 "${base_dir}"/crt/*)
for crt_file in ${crt_files}
do
    cer_name="$(basename ${crt_file})"
    pem_name="${cer_name%%.*}.pem"
    openssl x509 -inform der -in "${crt_file}" -outform pem > "/etc/ca-certificates/trust-source/blocklist/${pem_name}"
done

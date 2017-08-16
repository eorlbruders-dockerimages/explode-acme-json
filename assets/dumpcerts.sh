#!/usr/bin/env bash

for domain in "${DOMAINS_TO_DUMP[@]}"
do
	mkdir -p /certs/$domain
 	python /dumpcerts.python /acme/acme.json $domain /certs/$domain
done

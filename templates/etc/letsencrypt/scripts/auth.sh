#!/usr/bin/env bash
{{ ansible_managed | comment }}
set -e
set -u
set -o pipefail

NSUPDATE="nsupdate -k /etc/letsencrypt/scripts/{{ item }}-key.conf"
DNSSERVER="{{ global_certbot.certs[item].server }}"
ZONE="{{ global_certbot.certs[item].zone }}"
TTL=300

printf "server %s\nzone %s.\nupdate add {{ global_certbot.certs[item].record }} %d in TXT \"%s\"\nsend\n" "${DNSSERVER}" "${ZONE}" "${TTL}" "${CERTBOT_VALIDATION}" | $NSUPDATE
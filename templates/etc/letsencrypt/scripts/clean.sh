#!/usr/bin/env bash
{{ ansible_managed | comment }}
set -e
set -u
set -o pipefail

NSUPDATE="nsupdate -k /etc/letsencrypt/scripts/{{ certbot.certname }}-key.conf"
DNSSERVER="{{ certbot.dns.server }}"
ZONE="{{ certbot.dns.zone }}"
TTL=1

printf "server %s\nzone %s.\nupdate delete {{ certbot.dns.record }} %d in TXT \"%s\"\nsend\n" "${DNSSERVER}" "${ZONE}" "${TTL}" "${CERTBOT_VALIDATION}" | $NSUPDATE

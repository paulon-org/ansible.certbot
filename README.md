# Example with nginx
```
- hosts: <hosts>
  vars:
    certbot:
      mail: mail@example.org
      certname: site1.example.org
      domains: [ site1.example.org, site2.example.org ]
      authenticator: nginx
  roles:
    - certbot
```
# Exemple with dns
```
- hosts: <hosts>
  vars:
    certbot:
      mail: mail@example.org
      certname: site1.example.org
      domains: [ site1.example.org, site2.example.org ]
      authenticator: dns
      dns:
        server: dns1.example.org
        zone: example.org
        record: _acme-challenge.example.org
        keyname: dns_key.example.org
        secret: someverysecretkey
  roles:
    - certbot
```
# Example
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

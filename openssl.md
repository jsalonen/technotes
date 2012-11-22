# OpenSSL

## Config

Ubuntu:

    /etc/ssl/openssl.cnf

## Troubleshooting

### Debugging SSL client:

	openssl s_client -connect host.com:443

- Regarding Ubuntu's OpenSSL problem: <http://serverfault.com/questions/389197/ssl-routinesssl23-writessl-handshake-failure>
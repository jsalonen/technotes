# SSH

## Tunneling HTTP over socks proxy

Start ssh with proxy:

    ssh -D 5000 -N proxy-via-servername.com

Leave the proxy server open.

Use curl to make HTTP requests over the proxy to target server:

    curl --socks localhost:5000 https://targetdomain.example.com/http/get/stuff

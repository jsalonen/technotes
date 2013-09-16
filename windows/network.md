# Windows Network Configuration

## Port forwading

Forward localhost port 8080 to remote address example.com port 80:

    netsh interface portproxy add v4tov4 listenport=8080 listenaddress=127.0.0.1 connectport=80 connectaddress=example.com
    

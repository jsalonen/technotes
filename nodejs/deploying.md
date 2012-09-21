# Deploying node.js

## Linux server: supervisord + monit

### Install and setup supervisor

Very helpful links we are following here:

- <http://supervisord.org/>
- <http://blog.fgribreau.com/2012/03/process-management-at-bringr.html>

Python with setuptools is required. After that:

    easy_install supervisor

Create configuration:

    sudo bash
    echo_supervisord_conf > /etc/supervisord.conf

Append your programs config into `supervisord.conf` with something like this:

    [program:myapp-production]
    command=node myapp.js; the program (relative uses PATH, can take args)
    directory=/www/myapp-production ; directory to cwd to before exec (def no cwd)
    process_name=myapp-production; process_name expr (default %(program_name)s)
    autorestart=true ; whether/when to restart (default: unexpected)
    startsecs=1 ; number of secs prog must stay running (def. 1)
    stopwaitsecs=10 ; max num secs to wait b4 SIGKILL (default 10)
    stdout_logfile=/var/log/myapp-production.log ; stdout log path, NONE for none default AUTO
    stderr_logfile=/var/log/myapp-production.err.log ; stderr log path, NONE for none default AUTO

Start `supervisord`:

    sudo /usr/local/bin/supervisord

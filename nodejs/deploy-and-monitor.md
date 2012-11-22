# Deploying and Monitoring node.js

## Deploying

### On a Linux server with supervisord + monit

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

### Trips & Tricks

- Proxy with nodejs and express: <http://stackoverflow.com/questions/7559862/proxy-with-nodejs-and-express>
- How do you detect the environment in an expressjs app?: <http://stackoverflow.com/questions/8449665/how-do-you-detect-the-environment-in-an-expressjs-app>
- NODE_ENV with forever: <http://stackoverflow.com/questions/7674565/node-express-set-node-env-when-using-forever-to-run-script-continiously>
- Node.js process management: <http://blog.fgribreau.com/2012/03/process-management-at-bringr.html>
- Simple snippet for cross-platform .pid management in NodeJS: <https://gist.github.com/1846952#file_pid.js>

## On SSL

- Self-signing SSL certificate: https://devcenter.heroku.com/articles/ssl-certificate-self
- Node.js express.js SSL example: http://silas.sewell.org/blog/2010/06/03/node-js-https-ssl-server-example/
- Node.js nginx SSL: http://stackoverflow.com/questions/10375659/nginx-proxy-pass-node-ssl
- Proxying Websocket Traffic for Node.js: The Present State of Play: http://www.exratione.com/2012/07/proxying-websocket-traffic-for-nodejs-the-present-state-of-play/

## Monitoring

- Node monitoring: <https://github.com/lorenwest/node-monitor>

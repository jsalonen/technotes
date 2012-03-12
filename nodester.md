# Nodester

Nodester = OpenSource Node.js application platform <http://nodester.com/>.
It's dead simple to use. It is also under somewhat active development.

## Quick Guide to Deployment

### Prerequisites

- Install Node.js
- Install Nodester CLI (`npm install nodester-cli -g` as admin)
- Setup Nodester account. Also setup it to your console:
 - `nodester user setup [username] [password]`

### Creating Completely New App

Run:

	nodester app create [appname]
	nodester app init [appname]

### Deploying project from existing git repository

Instead of the above, go to your existing git repo and run:

	nodester app create [appname]
	nodester app info [appname]
	git remote add nodester git@nodester.com:node/git/<username>/<repo_id>.git 
	git push nodester remote

### Installing Modules

	nodester npm install [appname] express socket.io jade cradle etc
	nodester app restart [appname]

See your app live at `http://[appname].nodester.com`

If (when) it doesn't work, check app logs:

	nodester app logs [appname]

### Configuring your app

`console.log(process.env)` gives us something like:

	{ PATH: '/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin',
	  NODE_ENV: 'production',
	  app_port: '15508',
	  app_host: '127.0.0.1' }

-> Minimally you can use `app_port` to configure your app, like:

	var port = process.env.app_port || process.env.PORT || 8080;

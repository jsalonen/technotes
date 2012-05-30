# MongoDB

## Installing MongoDB

Installing on Unix: http://www.mongodb.org/display/DOCS/Quickstart+Unix

## Configuration

Config file is at `/etc/mongob.conf`

You may want to customize etc. logpath.

## Starting / stopping

http://www.mongodb.org/display/DOCS/Starting+and+Stopping+Mongo

Start with upstart:

     sudo service mongodb start

Stop with upstart:

     sudo service mongodb stop

## Setting up authentication (admin)

http://www.mongodb.org/display/DOCS/Security+and+Authentication

Enter `mongod` and run:

	use admin
	db.addUser("adminusername", "password")

Now start using admin:

	use admin
	db.auth("adminusername", "password")

Note: you need to authenticate inside `admin`, otherwise it won't work.

After admin has been created you may enable authentication, by either:

- Running `mongo` with `--auth`
- Enabling authentication in `/etc/mongodb.conf`


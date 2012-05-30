# MongoDB

## Installing MongoDB on Ubuntu

http://www.mkyong.com/mongodb/how-to-install-mongodb-on-ubuntu/    

We assume here that we are running on a late Ubuntu with Upstart based MongoDB.

## Configuration

Config file is at `/etc/mongob.conf`

You may want to customize etc. logpath.

## Starting / stopping

http://www.mongodb.org/display/DOCS/Starting+and+Stopping+Mongo

Start with upstart:

     sudo service mongodb start

Stop with upstart:

     sudo service mongodb stop

## Setting up accounts

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


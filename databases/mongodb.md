# MongoDB

## Installing MongoDB on Ubuntu

http://www.mkyong.com/mongodb/how-to-install-mongodb-on-ubuntu/    

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


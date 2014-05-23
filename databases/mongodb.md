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

## Setting up per database user accounts
  
Enter `mongod` and login with an admin account. For example:	

	use admin
	db.auth("adminusername", "password")

Now change DB to what you wish and create user:

	use yourdbname
        db.addUser("dbusername", "password")

## Firewall setup

Given that your MongoDB is running in authenticated mode, you may need to change your firewall to allow connections:

     sudo iptables -A INPUT -p tcp --dport 27017 -j ACCEPT
     sudo iptables -A OUTPUT -p tcp --dport 27017 -j ACCEPT

## Backups

When database is running, use `mongodump`:

    mongodump --host example.com --db dbname --username user1 --password password1

Creates `dump` directory under current workdir

## JSON and CSV Export

JSON export is the default:

    mongexport --db users --collection contacts --out userbackup.json

Parametrized CSV export example:

- run a query in database `db1` in collection `col1`,
- query for documents with case-insensitive regexp title matching,
- sort resuts by date created in ascending order and return fields `created` and `userId`,
- and export to CSV file `dump.csv`:

    mongoexport --csv -d dn1 -c col1 -q '{"title": /^example$/i}' -f "created","userId" --sort '{"created": -1}' -o dump.csv

## Resources

MongoDB book: <http://shop.oreilly.com/product/0636920001096.do>

# PostgreSQL

## Minimal Setup on Linux

Install:

	aptitude install postgresql postgresql-client

Login as PostgreSQL superuse:

	su postgres

Connect to default database:

	psql template1

Create new user, database and grant privileges (http://wiki.debian.org/PostgreSql):

	template1=#CREATE USER mypguser WITH PASSWORD 'mypguserpass';
	template1=#CREATE DATABASE mypgdatabase;
	template1=#GRANT ALL PRIVILEGES ON DATABASE mypgdatabase to mypguser;

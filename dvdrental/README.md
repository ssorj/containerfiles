# Dvdrental

A containerized example using PostgreSQL and the dvdrental sample
database.

Run the server:

~~~
podman run -p 5432:5432 --rm -it quay.io/ssorj/dvdrental
~~~

Connect a client:

~~~
PGPASSWORD=dvdrental psql -h localhost dvdrental dvdrental
~~~

Use `\dt` to list the database tables.  Use `select * from <table>;` to
explore the sample data.  Use `\h` for help.  Use `\q` to quit.

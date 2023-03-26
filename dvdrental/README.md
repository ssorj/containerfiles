# DVD Rental

A containerized example using [PostgreSQL][postgres] and the
[dvdrental][dvdrental] sample database.

[postgres]: https://www.postgresql.org/
[dvdrental]: https://www.postgresqltutorial.com/postgresql-getting-started/postgresql-sample-database/

## Run the server

~~~
podman run -p 5432:5432 --rm -it quay.io/ssorj/dvdrental
~~~

## Connection parameters

~~~
Host:     localhost (or wherever you end up exposing it)
Port:     5432
Database: dvdrental
Username: dvdrental
Password: dvdrental
~~~

PostgreSQL connection URI:

~~~
postgres://dvdrental:dvdrental@localhost:5432/dvdrental
~~~

JDBC URL:

~~~
jdbc:postgresql://localhost:5432/dvdrental?user=dvdrental&password=dvdrental
~~~

## Connect using `psql`

~~~
PGPASSWORD=dvdrental psql -h localhost dvdrental dvdrental
~~~

Use `\dt` to list the database tables.  Use `select * from <table>;`
to explore the data.  Use `\h` for help.  Use `\q` to quit.

## Connect using [DBeaver][dbeaver]

[dbeaver]: https://dbeaver.io/

<img src="dbeaver.png" width="640"/>

## Use [PostgREST][postgrest] to expose the database as an API

[postgrest]: https://postgrest.org/en/stable/index.html

~~~
podman run --rm --net=host \
    -e PGRST_DB_URI="postgres://dvdrental:dvdrental@localhost/dvdrental" \
    -e PGRST_DB_ANON_ROLE=dvdrental \
    docker.io/postgrest/postgrest
~~~

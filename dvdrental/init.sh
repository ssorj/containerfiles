#!/bin/sh

set -ex

PGPASSWORD="$POSTGRES_PASSWORD"

pg_restore --verbose --dbname dvdrental --username dvdrental --no-owner --exit-on-error /data/dvdrental.tar

#!/bin/sh

set -ex

gunzip -c /dvdrental.tar.gz > /tmp/dvdrental.tar

PGPASSWORD="$POSTGRES_PASSWORD"

pg_restore --verbose --exit-on-error --no-owner --dbname dvdrental --username dvdrental /tmp/dvdrental.tar

rm /tmp/dvdrental.tar

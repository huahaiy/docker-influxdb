#!/bin/bash

set -e

if [ "$1" = 'influxdb' ]; then

  sed -ri "s|/var/lib/influxdb/data|$INFLUXDB_DATA|" /etc/influxdb/influxdb.conf
  sed -ri "s|/var/lib/influxdb/meta|$INFLUXDB_META|" /etc/influxdb/influxdb.conf
  sed -ri "s|/var/lib/influxdb/wal|$INFLUXDB_WAL|" /etc/influxdb/influxdb.conf
  sed -ri "s|/var/lib/influxdb/hh|$INFLUXDB_HH|" /etc/influxdb/influxdb.conf

  if [[ -n "$INFLUXDB_HOSTNAME" ]]; then
    echo "hostname = \"$INFLUXDB_HOSTNAME\"" >> /etc/influxdb/influxdb.conf
  fi

  if [[ -n "$INFLUXDB_BIND_ADDRESS" ]]; then
    sed -ri "s|:8088|$INFLUXDB_BIND_ADDRESS|" /etc/influxdb/influxdb.conf
  fi

  if [[ -n "$INFLUXDB_HTTP_BIND_ADDRESS" ]]; then
    sed -ri "s|:8091|$INFLUXDB_HTTP_BIND_ADDRESS|" /etc/influxdb/influxdb.conf
  fi

  cat /etc/influxdb/influxdb.conf

  exec influxd -config /etc/influxdb/influxdb.conf
fi

exec "$@"

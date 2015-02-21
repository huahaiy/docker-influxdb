#!/bin/bash
set -e

if [ "$1" = 'influxdb' ]; then

  sed -ri "s|/opt/influxdb/shared/data/db|$INFLUXDB_DATA|" /opt/influxdb/shared/config.toml
  sed -ri "s|/opt/influxdb/shared/log.txt|$INFLUXDB_LOG/log.txt|" /opt/influxdb/shared/config.toml
  sed -ri "s|/opt/influxdb/shared/data/wal|$INFLUXDB_WAL|" /opt/influxdb/shared/config.toml

  cat /opt/influxdb/shared/config.toml

  exec influxdb -config /opt/influxdb/shared/config.toml
fi

exec "$@"

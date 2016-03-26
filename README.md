# docker-influxdb

InfluxDB 0.11.0

Data is stored in `/influxdb_data`, which is exposed as a valume to be linked to the host.The same goes for meta, hinted-handoff and WAL directory, `/influxdb_meta`, `/influxdb_hh` and `/influxdb_wal`, respectively.

The following environment variables can be set: INFLUXDB_HOSTNAME, INFLUXDB_BIND_ADDRESS, INFLUXDB_HTTP_BIND_ADDRESS, otherwise the defaults are used.

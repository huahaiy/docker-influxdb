#
# InfluxDB
#
# Version     0.1
#

FROM huahaiy/debian

MAINTAINER Huahai Yang <hyang@juji-inc.com>

RUN \
  echo "===> install InfluxDB..."  && \
  wget https://s3.amazonaws.com/influxdb/influxdb_latest_amd64.deb && \
  dpkg -i influxdb_latest_amd64.deb && \
  rm influxdb_latest_amd64.deb && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV INFLUXDB_DATA /influxdb_data

ENV INFLUXDB_WAL /influxdb_wal

ENV INFLUXDB_LOG /influxdb_log

COPY ./docker-entrypoint.sh /

VOLUME ["/influxdb_data","/influxdb_wal","/influxdb_log"]

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 8083 8086 8090 8099 

CMD ["influxdb"]

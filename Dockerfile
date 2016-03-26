#
# InfluxDB
#
# Version     0.4
#

FROM huahaiy/debian

MAINTAINER Huahai Yang <hyang@juji-inc.com>

RUN \
  echo "===> install InfluxDB..."  && \
  wget https://s3.amazonaws.com/influxdb/influxdb_0.11.0-1_amd64.deb && \
  dpkg -i influxdb_0.11.0-1_amd64.deb && \
  rm influxdb*.deb && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV INFLUXDB_DATA /influxdb_data

ENV INFLUXDB_WAL /influxdb_wal

ENV INFLUXDB_META /influxdb_meta

ENV INFLUXDB_HH /influxdb_hh

COPY ./docker-entrypoint.sh /

VOLUME ["/influxdb_data","/influxdb_wal","/influxdb_meta","/influxdb_hh"]

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 8083 8086 8090 8099 

CMD ["influxdb"]

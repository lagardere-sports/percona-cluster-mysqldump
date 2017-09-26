FROM percona:5.6

RUN \
  apt-get update -y -q && \
  apt-get install netcat curl python percona-xtradb-cluster-garbd-5.7 -y

RUN cd /usr/local/bin; curl https://storage.googleapis.com/pub/gsutil.tar.gz| tar xfz -

COPY backup.sh /usr/local/bin/
COPY customize_backup.sh /backup/backup.sh

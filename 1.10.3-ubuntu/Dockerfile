FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -yy curl ssh docker.io

RUN mkdir -pv /root/.ssh
RUN chmod 700 /root/.ssh/
COPY id_rsa.pub /root/.ssh/authorized_keys
RUN chmod 600 /root/.ssh/authorized_keys

COPY entry.sh /
RUN chmod 777 /entry.sh
ENTRYPOINT ["/entry.sh"]

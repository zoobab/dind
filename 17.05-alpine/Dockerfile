FROM alpine:3.6

RUN apk update
RUN apk add docker openssh screen

RUN ssh-keygen -A

RUN mkdir -pv /root/.ssh
RUN chmod 700 /root/.ssh/
COPY id_rsa_dind.pub /root/.ssh/authorized_keys
RUN chmod 600 /root/.ssh/authorized_keys

COPY entry.sh /
RUN chmod 777 /entry.sh
ENTRYPOINT ["/entry.sh"]

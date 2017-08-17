FROM alpine:3.6

RUN apk update
RUN apk add docker openssh

RUN ssh-keygen -A
RUN sshd &
RUN dockerd &
RUN sleep 10

RUN mkdir -pv /root/.ssh
RUN chmod 700 /root/.ssh/
COPY id_rsa.pub /root/.ssh/authorized_keys
RUN chmod 600 /root/.ssh/authorized_keys

COPY daemon.sh /
RUN chmod 777 /daemon.sh
CMD /daemon.sh 

COPY entry.sh /
RUN chmod 777 /entry.sh
ENTRYPOINT ["/entry.sh"]

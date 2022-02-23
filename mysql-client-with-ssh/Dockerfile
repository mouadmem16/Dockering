FROM alpine:latest
LABEL maintainer="Mouaad"
RUN apk add --update --no-cache openssh 
RUN echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config
RUN echo 'PubkeyAuthentication yes' >> /etc/ssh/sshd_config
RUN echo 'PubkeyAcceptedAlgorithms=+ssh-rsa' >> /etc/ssh/sshd_config
RUN adduser -h /home/mouaad -s /bin/sh -D mouaad
RUN echo -n 'mouaad:123AZE123' | chpasswd
RUN apk add --update --no-cache mysql-client
COPY key.pub /home/mouaad/.ssh/authorized_keys
RUN chmod 600 /home/mouaad/.ssh/authorized_keys && \
    chown mouaad:mouaad /home/mouaad/.ssh/authorized_keys
COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 22

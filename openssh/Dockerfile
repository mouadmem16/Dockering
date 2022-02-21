FROM alpine:latest
LABEL maintainer="Mouaad"
RUN apk add --update --no-cache openssh 
RUN echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config
RUN adduser -h /home/mouaad -s /bin/sh -D mouaad
RUN echo -n 'mouaad:123AZE123' | chpasswd
ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 22
COPY entrypoint.sh /

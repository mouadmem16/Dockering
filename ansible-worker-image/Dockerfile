
FROM ubuntu:18.04
LABEL maintainer="Mouaad"
RUN apt update -y; apt install openssh-server sudo software-properties-common -y -y && \
    echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config && \
    echo 'PubkeyAuthentication yes' >> /etc/ssh/sshd_config && \
    echo 'PubkeyAcceptedKeyTypes=+ssh-rsa' >> /etc/ssh/sshd_config && \
    useradd -m -d /home/mouaad -s /bin/bash -G root,sudo mouaad && \
    service ssh start && \
    echo -n 'mouaad:123AZE123' | chpasswd 
COPY key.pub /home/mouaad/.ssh/authorized_keys
ENV DEBIAN_FRONTEND=noninteractive
RUN chmod 600 /home/mouaad/.ssh/authorized_keys && \
    chown mouaad:mouaad /home/mouaad/.ssh/authorized_keys && \
    add-apt-repository -y ppa:deadsnakes/ppa && \
    apt-get update && apt-get install -y python3 python3-pip && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/ && apt-get clean autoclean && apt-get autoremove --yes

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 22



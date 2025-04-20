FROM ubuntu:18.04

LABEL maintainer="Mouaad"
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Africa/Casablanca

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    openssh-server \
    sudo \
    software-properties-common && \
    add-apt-repository --yes --update ppa:ansible/ansible && \
    apt-get install -y ansible && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config && \
    echo 'PubkeyAuthentication yes' >> /etc/ssh/sshd_config && \
    echo 'PubkeyAcceptedKeyTypes=+ssh-rsa' >> /etc/ssh/sshd_config && \
    useradd -m -d /home/mouaad -s /bin/bash -G root,sudo mouaad && \
    service ssh start && \
    echo -n 'mouaad:123AZE123' | chpasswd 

COPY key.pub /home/mouaad/.ssh/authorized_keys
RUN chmod 600 /home/mouaad/.ssh/authorized_keys && \
    chown mouaad:mouaad /home/mouaad/.ssh/authorized_keys && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/ && apt-get clean autoclean && apt-get autoremove --yes

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 22

FROM centos:centos7
LABEL maintainer="Mouaad"
RUN yum install --disableplugin=fastestmirror openssh-server openssh-clients sudo -y && \
    echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config && \
    echo 'PubkeyAuthentication yes' >> /etc/ssh/sshd_config && \
    echo 'PubkeyAcceptedKeyTypes=+ssh-rsa' >> /etc/ssh/sshd_config && \
    adduser -d /home/mouaad -m -s /bin/bash mouaad && \
    usermod -aG wheel mouaad && \
    echo -n 'mouaad:123AZE123' | chpasswd && \
    echo "mouaad  ALL=(ALL)       ALL" >> /etc/sudoers
COPY key.pub /home/mouaad/.ssh/authorized_keys
RUN chmod 600 /home/mouaad/.ssh/authorized_keys && \
    chown mouaad:mouaad /home/mouaad/.ssh/authorized_keys && \
    yum clean metadata && yum clean all && yum clean headers && yum clean packages 
COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 22


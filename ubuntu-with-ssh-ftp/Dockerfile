FROM ubuntu:18.04
LABEL maintainer="Mouaad"
RUN apt update -y; apt install openssh-server vsftpd sudo -y && \
    echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config && \
    echo 'PubkeyAuthentication yes' >> /etc/ssh/sshd_config && \
    echo 'PubkeyAcceptedKeyTypes=+ssh-rsa' >> /etc/ssh/sshd_config && \
    echo 'write_enable=YES' >> /etc/vsftpd.conf && \
    useradd -m -d /home/mouaad -s /bin/bash -G root,sudo mouaad && \
    service ssh start && \
    echo -n 'mouaad:123AZE123' | chpasswd
    
RUN service vsftpd start 
COPY key.pub /home/mouaad/.ssh/authorized_keys
RUN chmod 600 /home/mouaad/.ssh/authorized_keys && \
    chown mouaad:mouaad /home/mouaad/.ssh/authorized_keys && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/ && apt-get clean autoclean && apt-get autoremove --yes
COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 22
EXPOSE 21

FROM jenkins/inbound-agent:4.11.2-4
USER root
RUN apt update; apt install ansible -y;
RUN apt clean; apt autoremove --purge; rm -rf /var/lib/apt/lists/*;
USER jenkins

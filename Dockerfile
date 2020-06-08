FROM   centos:7

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN sudo mv ./kubectl /usr/local/bin/kubectl
RUN systemctl daemon-reload
RUN systemctl restart kubelet
RUN yum install net-tools -y
RUN yum install java-11-openjdk.x86_64 -y
RUN yum install openssh-server -y
RUN yum update -qy



COPY ca.crt :/
COPY client.key :/
COPY client.certificate :/
COPY config.yml :/

EXPOSE 8442
CMD ["/usr/sbin/sshd", "-D"]

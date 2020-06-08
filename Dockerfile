FROM   centos:7

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl
RUN yum install net-tools -y
RUN yum install java-11-openjdk.x86_64 -y
RUN yum install openssh-server -y
RUN yum update -qy
RUN yum install httpd -y

EXPOSE 8442
CMD ["/usr/sbin/sshd", "-D"]

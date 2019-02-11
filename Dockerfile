FROM rndmh3ro/docker-centos7-ansible:latest

RUN yum clean all

RUN yum groupinstall -y 'Development Tools'

RUN yum install -y \
sudo \
openssh-server \ 
openssh-clients \
which \
curl \
htop \
unzip \
libffi-devel \
readline-devel \
sqlite-devel \
zlib-devel \
libyaml-devel \
openssl-devel \
python-lxml \
cronie \
nginx \
python-devel

RUN curl -L https://www.chef.io/chef/install.sh | bash

RUN sed -i 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config

RUN systemctl enable sshd.service
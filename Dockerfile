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
python-devel \
wget

RUN wget https://packages.chef.io/files/stable/inspec/4.3.2/el/7/inspec-4.3.2-1.el7.x86_64.rpm -O inspec.rpm

RUN yum localinstall inspec.rpm -y

RUN sed -i 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config

RUN systemctl enable sshd.service
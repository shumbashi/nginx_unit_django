FROM centos:7

MAINTAINER Ahmed Shibani (Shumbashi) "sheipani@gmail.com"

RUN echo $'[unit] \n\
name=unit repo \n\
baseurl=http://nginx.org/packages/mainline/centos/7/$basearch/ \n\
gpgcheck=0 \n\
enabled=1' > /etc/yum.repos.d/unit.repo && yum install -y unit epel-release && yum install -y python-pip && pip install django

WORKDIR /srv/

RUN django-admin startproject app

COPY config.json /srv/app/config.json

EXPOSE 8000:8000

CMD ["/usr/sbin/unitd", "--no-daemon"]


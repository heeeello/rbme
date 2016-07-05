FROM debian:jessie

RUN apt-get update && \
    apt-get -y install wget \
               make \
               openssh-server \
               rsync \
               cron \
               procmail \
               heirloom-mailx \
               ssmtp \
               locales \
               vim-tiny \
               curl 

ADD rbme /usr/bin/rbme

ADD rbme.conf /etc/rbme.conf


RUN locale-gen zh_CN.UTF-8
RUN locale-gen en_US.UTF-8
RUN dpkg-reconfigure locales

RUN echo "Asia/Shanghai" > /etc/timezone; dpkg-reconfigure -f noninteractive tzdata




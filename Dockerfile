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


## Just works on debian:jessie 
RUN echo "zh_CN.UTF-8 UTF-8\nen_US.UTF-8 UTF-8" >>/etc/locale.gen && locale-gen
ENV LC_ALL zh_CN.UTF-8     


RUN echo "Asia/Shanghai" > /etc/timezone; dpkg-reconfigure -f noninteractive tzdata




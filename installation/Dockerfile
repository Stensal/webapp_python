FROM debian:jessie
LABEL Maintainer1="Ning <ning@stensalinc.com>"

RUN apt-get update
RUN apt-get install -y nginx-full \
    && apt-get install -y php5 php5-fpm php5-cgi php5-xdebug

RUN apt-get install -y build-essential cmake

RUN apt-get install -y git automake
RUN apt-get install -y automake libtool zlib1g-dev \
                       libssh-gcrypt-dev libssl-dev \
                       python libpython2.7-dev libbz2-dev \
                       vim libcap-dev mailutils

RUN apt-get install -y gettext clang-3.5
RUN apt-get autoclean
RUN apt-get clean
RUN apt-get autoremove

FROM debian:wheezy
MAINTAINER David Personette <dperson@dperson.com>

ENV term=linux

# Install openvpn
RUN export DEBIAN_FRONTEND='noninteractive' && \
    apt-get update -qq && apt-get -s dist-upgrade -y && \
    apt-get install -qqy --no-install-recommends mtr iptables openvpn  

RUN apt-get install -qqy  vuze
RUN apt-get clean 

COPY openvpn.sh /usr/bin/

VOLUME ["/run", "/tmp", "/var/cache", "/var/lib", "/var/log", "/var/tmp", \
            "/vpn"]

ENTRYPOINT ["openvpn.sh"]

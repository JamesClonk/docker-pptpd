FROM debian:jessie

MAINTAINER JamesClonk

RUN apt-get update && \
	apt-get install -y pptpd iptables && \
	rm -rf /var/lib/apt/lists/*

RUN echo "easy-vpn * easy-vpn *"		>> /etc/ppp/chap-secrets && \
	echo "localip 192.168.0.1"			>> /etc/pptpd.conf && \
	echo "remoteip 192.168.0.100-120"	>> /etc/pptpd.conf && \
	echo "ms-dns 8.8.8.8"				>> /etc/ppp/pptpd-options && \
	echo "ms-dns 8.8.4.4"				>> /etc/ppp/pptpd-options

EXPOSE 1723

ADD start-server.sh /start-server.sh
CMD ["/start-server.sh"]

FROM resin/rpi-raspbian:stretch
MAINTAINER uktricky

RUN apt-get update && apt-get install -y proftpd-basic
RUN mkdir /users

ADD proftpd.conf /etc/proftpd/
ADD entrypoint.sh /

RUN chmod u+x /entrypoint.sh

EXPOSE 20 21 50000-50050

ENTRYPOINT ["bash","/entrypoint.sh"]
CMD /usr/sbin/proftpd -n -c /etc/proftpd/proftpd.conf

FROM ruby:2.1.2
MAINTAINER me@quangpham.com

RUN apt-get update
RUN apt-get dist-upgrade -y -q
RUN apt-get install -y -q supervisor

RUN mkdir -p /var/log/supervisor
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf


# Add Start server
ADD start.sh /start.sh
RUN chmod 755 /start.sh

ADD testme.sh /testme.sh
RUN chmod 755 /testme.sh

CMD ["/bin/bash", "-e", "/start.sh"]

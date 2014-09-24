FROM ruby:2.1.2
MAINTAINER me@quangpham.com

# Add Start server
ADD start.sh /start.sh
RUN chmod 755 /start.sh

ADD testme.sh /testme.sh
RUN chmod 755 /testme.sh

CMD ["/bin/bash", "-e", "/start.sh"]

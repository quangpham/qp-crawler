FROM debian:wheezy
MAINTAINER me@quangpham.com

# Install nginx, nodejs and curl
RUN apt-get update -q
RUN apt-get install -q -y curl supervisor git

# Install mysql client
RUN apt-get install -qy libmysqld-dev libmysqlclient-dev mysql-client

# Install rvm, ruby, bundler
RUN curl -sSL https://get.rvm.io | bash -s stable
RUN /bin/bash -l -c "rvm requirements"
RUN /bin/bash -l -c "rvm install 2.1.0"
RUN /bin/bash -l -c "gem install bundler --no-ri --no-rdoc"

# Config supervisor
RUN mkdir -p /var/log/supervisor
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ADD crawl.sh /crawl.sh
RUN chmod 755 /crawl.sh

# Add Start server
ADD start.sh /start.sh
RUN chmod 755 /start.sh

# bundle install
RUN /bin/bash -l -c "bundle install"

CMD ["/bin/bash", "-e", "/start.sh"]

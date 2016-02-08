FROM ubuntu:14.04

MAINTAINER James Cross <mail@jamescross.io>

RUN apt-get -y update \
	&& apt-get -y install openjdk-7-jdk \
	&& apt-get -y install npm \
	&& apt-get -y install supervisor \
	&& apt-get -y install wget \
	&& apt-get -y install libfontconfig

RUN wget http://mirror.ox.ac.uk/sites/rsync.apache.org/incubator/zeppelin/0.5.5-incubating/zeppelin-0.5.5-incubating-bin-all.tgz
RUN tar -xzvf zeppelin-0.5.5-incubating-bin-all.tgz
RUN mv zeppelin-0.5.5-incubating-bin-all /opt/zeppelin
RUN touch opt/zeppelin/conf/zeppelin-env.sh
RUN mv /opt/zeppelin/conf/zeppelin-env.sh.template opt/zeppelin/conf/zeppelin-env.sh

COPY conf/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf

EXPOSE 8080
#CMD /bin/bash
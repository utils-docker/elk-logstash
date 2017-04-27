FROM docker.elastic.co/logstash/logstash:5.3.1
MAINTAINER Fábio Luciano <fabioluciano@php.net>
LABEL Description="ELK - Logstash"


ADD pipeline/ /usr/share/logstash/pipeline/
ADD config/ /usr/share/logstash/config/

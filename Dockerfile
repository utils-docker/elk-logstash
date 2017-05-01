FROM docker.elastic.co/logstash/logstash:5.3.2
MAINTAINER Fábio Luciano <fabioluciano@php.net>
LABEL Description="ELK - Logstash"

ENV elk_logstash_bin '/opt/logstash'
ENV elk_logstash_home '/usr/share/logstash'

ARG elk_elasticsearch
ENV elk_elasticsearch ${elk_elasticsearch:-"http://172.18.0.10:9200"}

ARG elk_logstash
ENV elk_logstash ${elk_logstash:-"172.18.0.11:5044"}

ARG elk_kibana
ENV elk_kibana ${elk_kibana:-"http://172.18.0.12:5601"}

RUN $elk_logstash_bin/bin/logstash-plugin install logstash-input-beats

RUN rm /usr/share/logstash/pipeline/logstash.conf
ADD files/pipeline/ $elk_logstash_home/pipeline/
ADD files/config/* $elk_logstash_home/config/

USER root

EXPOSE 5044/tcp

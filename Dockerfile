#
# Copyright 2015-2016 The OpenZipkin Authors
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except
# in compliance with the License. You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software distributed under the License
# is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express
# or implied. See the License for the specific language governing permissions and limitations under
# the License.
#
FROM openzipkin/jre-full:1.8.0_131
MAINTAINER OpenZipkin "http://zipkin.io/"

ENV ZIPKIN_REPO https://jcenter.bintray.com
ENV ZIPKIN_VERSION 1.28.1

#ENV SCRIBE_ENABLED true
#ENV KAFKA_BROKER_OUTPUT kafka.marathon.mesos:9042
#ENV KAFKA_TOPIC_OUTPUT zipkin-spans
#ENV STORAGE_TYPE elasticsearch
#ENV ES_HOSTS http://10.0.0.117:9200,http://10.0.0.118:9200

# Use to set heap, trust store or other system properties.
ENV JAVA_OPTS -Djava.security.egd=file:/dev/./urandom

# Add environment settings for supported storage types
COPY ./zipkin-server/target/zipkin-server-1.20.2-SNAPSHOT-exec.jar /zipkin/zipkin-server.jar
WORKDIR /zipkin

EXPOSE 9410 9411

CMD java -jar zipkin-server.jar 

FROM fluent/fluentd:v0.14.20-onbuild
MAINTAINER Tatsuya Fukata <tatsuya.fukata@gmail.com>

USER root

RUN apk add --update --virtual .build-deps \
        sudo build-base ruby-dev \
 # cutomize following instruction as you wish
 && sudo gem install \
        fluent-plugin-td \
 && sudo gem sources --clear-all \
 && apk del .build-deps \
 && rm -rf /var/cache/apk/* \
           /home/fluent/.gem/ruby/2.3.0/cache/*.gem

USER fluent

EXPOSE 24284

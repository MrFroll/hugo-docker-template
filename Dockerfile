FROM ubuntu:19.04

ARG hugo_version
ARG uid
ARG gid

ENV HUGO_BINARY hugo_extended_${hugo_version}_Linux-64bit.deb

WORKDIR /web

RUN addgroup --gid $gid web
RUN adduser -u $uid --disabled-password --gecos "" --force-badname --ingroup web web

RUN apt update
RUN apt -y install curl

RUN curl -sL -o /tmp/hugo.deb https://github.com/gohugoio/hugo/releases/download/v${hugo_version}/${HUGO_BINARY}
RUN dpkg -i /tmp/hugo.deb
RUN rm /tmp/hugo.deb

USER web

EXPOSE 1313
CMD echo 'started'
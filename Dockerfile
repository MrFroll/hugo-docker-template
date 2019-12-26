FROM ubuntu:19.04

ARG hugo_version

ENV HUGO_BINARY hugo_extended_${hugo_version}_Linux-64bit.deb

WORKDIR /web

RUN apt update
RUN apt -y install curl

RUN curl -sL -o /tmp/hugo.deb https://github.com/gohugoio/hugo/releases/download/v${hugo_version}/${HUGO_BINARY}
RUN dpkg -i /tmp/hugo.deb
RUN rm /tmp/hugo.deb


RUN addgroup --gid 1024 web_group
RUN adduser --disabled-password --gecos "" --force-badname --ingroup web_group web_user

USER web_user

EXPOSE 1313
CMD echo 'started'
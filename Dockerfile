FROM ubuntu:14.04

RUN  apt-get update && apt-get install -y build-essential

WORKDIR /app

ADD https://github.com/krallin/tini/releases/download/v0.13.2/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

ADD . .
RUN gcc -o /mcsend mcsend.c && gcc -o /mcreceive mcreceive.c


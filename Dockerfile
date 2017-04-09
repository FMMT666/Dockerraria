FROM debian:jessie

MAINTAINER FMMT666 <fmmt666@dev.null>

RUN  apt-get update && apt-get install -y cowsay fortune joe mc

COPY runthis.sh /
ENTRYPOINT ["/runthis.sh"]

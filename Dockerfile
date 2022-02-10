FROM debian:9

RUN apt-get update && apt-get install curl libgnutls28-dev -y

RUN cd /tmp/ && curl -o ./wget.deb  https://snapshot.debian.org/archive/debian/20131108T160046Z/pool/main/w/wget/wget_1.14-5_amd64.deb && \
    apt-get install ./wget.deb

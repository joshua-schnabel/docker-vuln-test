FROM debian:9

RUN apt-get update && apt-get install curl -y

RUN cd /tmp/ && curl –o https://snapshot.debian.org/archive/debian/20131108T160046Z/pool/main/w/wget/wget_1.14-5_amd64.deb && \
    apt-get install ./wget_1.14-5_amd64.deb

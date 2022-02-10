FROM debian:9

RUN apt-get update && apt-get install curl libgnutls28-dev -y



RUN cd /tmp/ && curl -o ./libhogweed.deb https://snapshot.debian.org/archive/debian/20130505T005130Z/pool/main/n/nettle/libhogweed2_2.7-1_amd64.deb && \
    apt-get install ./libhogweed.deb
    
RUN cd /tmp/ && curl -o ./ibnettle.deb https://snapshot.debian.org/archive/debian/20130505T005130Z/pool/main/n/nettle/libnettle4_2.7-1_amd64.deb && \
    apt-get install ./ibnettle.deb

RUN cd /tmp/ && curl -o ./libgnutls.deb https://snapshot.debian.org/archive/debian/20131006T214656Z/pool/main/g/gnutls28/libgnutls28_3.2.4-5_amd64.deb && \
    apt-get install ./libgnutls.deb
    
RUN cd /tmp/ && curl -o ./wget.deb  https://snapshot.debian.org/archive/debian/20131108T160046Z/pool/main/w/wget/wget_1.14-5_amd64.deb && \
    apt-get install ./wget.deb

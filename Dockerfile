FROM debian:9

RUN apt-get update && apt-get install gcc bzip2 curl libgnutls28-dev make -y

#WGET 1.14 CVE-2019-5953 CVE-2018-20483 CVE-2018-20483 und mehr

RUN curl -o /tmp/ibnettle.deb https://snapshot.debian.org/archive/debian/20130505T005130Z/pool/main/n/nettle/libnettle4_2.7-1_amd64.deb && \
    apt-get install /tmp/ibnettle.deb && \
    curl -o /tmp/libhogweed.deb https://snapshot.debian.org/archive/debian/20130505T005130Z/pool/main/n/nettle/libhogweed2_2.7-1_amd64.deb && \
    apt-get install /tmp/libhogweed.deb  && \
    curl -o /tmp/libgnutls.deb https://snapshot.debian.org/archive/debian/20131006T214656Z/pool/main/g/gnutls28/libgnutls28_3.2.4-5_amd64.deb && \
    apt-get install /tmp/libgnutls.deb && \
    curl -o /tmp/wget.deb  https://snapshot.debian.org/archive/debian/20131108T160046Z/pool/main/w/wget/wget_1.14-5_amd64.deb && \
    apt-get install /tmp/wget.deb

RUN wget --version

RUN curl -LO http://www.mirrorservice.org/sites/ftp.gnu.org/gnu/wget/wget-1.15.tar.gz && \
    tar zxf wget-1.15.tar.gz && \
    cd wget-1.15 && \
    ./configure --prefix=/opt/wget2 && \
    make && \
    make install && \
    cd .. && \
    rm -rf wget-1.15 && \
    rm *.tar.gz

RUN ls -l /opt/wget2/bin

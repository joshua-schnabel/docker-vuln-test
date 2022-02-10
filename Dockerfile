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

#WGET 1.15 CVE-2019-5953 CVE-2018-20483 CVE-2018-20483 und mehr

RUN curl -LO http://www.mirrorservice.org/sites/ftp.gnu.org/gnu/wget/wget-1.15.tar.gz && \
    tar zxf wget-1.15.tar.gz && \
    cd wget-1.15 && \
    ./configure --prefix=/opt/wget2 && \
    make && \
    make install && \
    cd .. && \
    rm -rf wget-1.15 && \
    rm *.tar.gz

RUN opt/wget2/bin/wget --version

#JAVA 8u45
RUN curl -o /tmp/openjre-headless.deb https://snapshot.debian.org/archive/debian/20160423T042513Z/pool/main/o/openjdk-8/openjdk-8-jre-headless_8u91-b14-2_amd64.deb && \
    apt-get install -y /tmp/openjre-headless.deb && \
    curl -o /tmp/openjdk.deb https://snapshot.debian.org/archive/debian/20160423T042513Z/pool/main/o/openjdk-8/openjdk-8-jdk-headless_8u91-b14-2_amd64.deb && \
    apt-get install -y /tmp/openjdk.deb
    
RUN java --version
    
#TOMCAT 7.0.34

RUN curl -o /tmp/apache-tomcat-7.0.34.tar.gz https://ftp.metu.edu.tr/pub/mirrors/ftp.apache.org/tomcat/tomcat-7/v7.0.34/bin/apache-tomcat-7.0.34.tar.gz && \
    mkdir /opt/tomcat && tar xzvf /tmp/apache-tomcat-7.0.34.tar.gz -C /opt/tomcat --strip-components=1

RUN /opt/tomcat/apache-tomcat-7.0.34/bin/version.sh
    
    

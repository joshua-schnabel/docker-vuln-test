FROM debian:9

RUN apt-get update && apt-get install gcc bzip2 nodejs curl libgnutls28-dev make -y && apt-get clean autoclean && rm -rf /var/lib/{apt,dpkg,cache,log}/

#WGET 1.14 CVE-2019-5953 CVE-2018-20483 CVE-2018-20483 und mehr

RUN curl -o /tmp/ibnettle.deb https://snapshot.debian.org/archive/debian/20130505T005130Z/pool/main/n/nettle/libnettle4_2.7-1_amd64.deb && \
    apt-get install /tmp/ibnettle.deb && \
    curl -o /tmp/libhogweed.deb https://snapshot.debian.org/archive/debian/20130505T005130Z/pool/main/n/nettle/libhogweed2_2.7-1_amd64.deb && \
    apt-get install /tmp/libhogweed.deb  && \
    curl -o /tmp/libgnutls.deb https://snapshot.debian.org/archive/debian/20131006T214656Z/pool/main/g/gnutls28/libgnutls28_3.2.4-5_amd64.deb && \
    apt-get install /tmp/libgnutls.deb && \
    curl -o /tmp/wget.deb  https://snapshot.debian.org/archive/debian/20131108T160046Z/pool/main/w/wget/wget_1.14-5_amd64.deb && \
    apt-get install /tmp/wget.deb && rm -R /tmp/* && apt-get clean autoclean && rm -rf /var/lib/{apt,dpkg,cache,log}/

RUN wget --version

#WGET 1.15 CVE-2019-5953 CVE-2018-20483 CVE-2018-20483 und mehr

RUN cd /tmp/ && curl -LO http://www.mirrorservice.org/sites/ftp.gnu.org/gnu/wget/wget-1.15.tar.gz && \
    tar zxf wget-1.15.tar.gz && \
    cd wget-1.15 && \
    ./configure --prefix=/opt/wget2 && \
    make && \
    make install && \
    cd .. && \
    rm -rf wget-1.15 && \
    rm *.tar.gz

RUN opt/wget2/bin/wget --version

#JAVA 8u45 CVE-2020-2604
RUN curl -o /tmp/openjre-headless.deb https://snapshot.debian.org/archive/debian/20160423T042513Z/pool/main/o/openjdk-8/openjdk-8-jre-headless_8u91-b14-2_amd64.deb && \
    apt-get install -y /tmp/openjre-headless.deb && \
    curl -o /tmp/openjdk.deb https://snapshot.debian.org/archive/debian/20160423T042513Z/pool/main/o/openjdk-8/openjdk-8-jdk-headless_8u91-b14-2_amd64.deb && \
    apt-get install -y /tmp/openjdk.deb && rm -R /tmp/*
    
RUN java -version
    
#TOMCAT 7.0.34 CVE-2016-3092

RUN curl -o /tmp/apache-tomcat-7.0.34.tar.gz https://ftp.metu.edu.tr/pub/mirrors/ftp.apache.org/tomcat/tomcat-7/v7.0.34/bin/apache-tomcat-7.0.34.tar.gz && \
    mkdir /opt/tomcat && tar xzvf /tmp/apache-tomcat-7.0.34.tar.gz -C /opt/tomcat --strip-components=1  && rm -R /tmp/*

RUN /opt/tomcat/bin/version.sh

#Apache Commons Compress » 1.14 CVE-2021-36090 CVE-2021-35517 CVE-2021-35516 CVE-2021-35515 CVE-2018-11771

RUN mkdir /opt/java_libs && curl -o /opt/java_libs/cc.jar https://repo1.maven.org/maven2/org/apache/commons/commons-compress/1.14/commons-compress-1.14.jar

#Apache Commons Collections » 4.0 CVE-2015-6420

RUN curl -o /opt/java_libs/commons-collections4-4.0.jar https://repo1.maven.org/maven2/org/apache/commons/commons-collections4/4.0/commons-collections4-4.0.jar

# npm CVE-2020-11022 CVE-2019-10742
    
RUN cd / && mkdir /media/apps/ && mkdir /media/apps/npm && curl -sL https://deb.nodesource.com/setup_16.x | bash - && apt-get install -y build-essential nodejs

COPY ./npm /media/apps/npm

RUN cd /media/apps/npm && npm install

# java CVE-2020-9488 CVE-2021-44228 CVE-2021-44832 

COPY ./java/*.jar /media/apps/java/

RUN rm -R /tmp/*

CMD java -jar /media/apps/java/app-with-jars.jar

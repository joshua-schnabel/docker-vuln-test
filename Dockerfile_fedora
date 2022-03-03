FROM fedora:24

RUN yum install openssl-devel tar openssl-libs gcc bzip2 nodejs curl make openssl -y && yum clean all

#WGET 1.14 CVE-2019-5953 CVE-2018-20483 CVE-2018-20483 und mehr

RUN curl -o /tmp/wget.rpm https://archive.fedoraproject.org/pub/archive/fedora/linux/updates/18/x86_64/wget-1.14-5.fc18.x86_64.rpm && \
    yum install /tmp/wget.rpm -y && rm -R /tmp/* && yum clean all

RUN wget --version

#WGET 1.15 CVE-2019-5953 CVE-2018-20483 CVE-2018-20483 und mehr

RUN ls -l /usr/lib64/ && cd /tmp/ && curl -LO http://www.mirrorservice.org/sites/ftp.gnu.org/gnu/wget/wget-1.15.tar.gz && \
    tar zxf wget-1.15.tar.gz && \
    cd wget-1.15 && \
    ./configure --prefix=/opt/wget2 --with-ssl=openssl && \
    make && \
    make install && \
    cd .. && \
    rm -rf wget-1.15 && \
    rm *.tar.gz

RUN opt/wget2/bin/wget --version

#JAVA 8u45 CVE-2020-2604
RUN curl -o /tmp/openjdk.rpm https://archive.fedoraproject.org/pub/archive/fedora/linux/updates/22/x86_64/j/java-1.8.0-openjdk-1.8.0.91-2.b14.fc22.x86_64.rpm && \
    curl -o /tmp/openjdk-headless.rpm https://archive.fedoraproject.org/pub/archive/fedora/linux/updates/22/x86_64/j/java-1.8.0-openjdk-headless-1.8.0.91-2.b14.fc22.x86_64.rpm && \
    yum install /tmp/openjdk-headless.rpm /tmp/openjdk.rpm -y && rm -R /tmp/* && yum clean all
    
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
    
RUN cd / && mkdir /media/apps/ && mkdir /media/apps/npm && curl -sL https://rpm.nodesource.com/setup_16.x | bash -

COPY ./npm /media/apps/npm

RUN cd /media/apps/npm && npm install

# java CVE-2020-9488 CVE-2021-44228 CVE-2021-44832 

COPY ./java/*.jar /media/apps/java/

RUN rm -R /tmp/*

CMD java -jar /media/apps/java/app-with-jars.jar

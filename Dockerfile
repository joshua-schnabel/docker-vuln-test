FROM alpine:3.12
RUN apk update && apk --no-cache add curl gnutls-c++ gcc bzip2 && apk clean

# wget - command line utility (manual install)
#
# https://www.cvedetails.com/cve/CVE-2014-4877/
#
RUN curl -LO ${CURL_OPTIONS} \
      http://www.mirrorservice.org/sites/ftp.gnu.org/gnu/wget/wget-1.15.tar.gz && \
    tar zxf wget-1.15.tar.gz && \
    cd wget-1.15 && \
    ./configure --prefix=/opt/wget && \
    make && \
    make install && \
    cd .. && \
    rm -rf wget-1.15 && \
    rm *.tar.gz

RUN apk remove gnutls-bin gcc bzip2 -y && apk clean

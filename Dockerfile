FROM ubuntu:16.04

RUN apt-get update && apt-cache show openjdk-8-jdk && apt-get install openjdk-8-jdk=1.8.0_91-8u91-b14-3ubuntu1~16.04.1-b14 -y

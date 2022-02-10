FROM ubuntu:16.04

RUN apt-get update && apt-cache show openjdk-8-jdk

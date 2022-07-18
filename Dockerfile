FROM gradle:7.5-jdk8

RUN apt -y update && apt -y upgrade
RUN apt -y install libpam-google-authenticator

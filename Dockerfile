# Set the base image to Kali
FROM 32bit/ubuntu:16.04

MAINTAINER binkybear@nethunter.com

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update && apt-get -y dist-upgrade && apt-get clean
RUN apt-get install -y wget git

ENV KALI_WORKSPACE /opt/re4son-kernel-builder
RUN mkdir -p ${KALI_WORKSPACE}
COPY . ${KALI_WORKSPACE}
WORKDIR ${KALI_WORKSPACE}
RUN chmod +x ${KALI_WORKSPACE}/*.sh
RUN ${KALI_WORKSPACE}/setup.sh
RUN git clone --depth 1 https://github.com/raspberrypi/tools /opt/kernel-builder_tools

CMD ["re4sonbuild"]

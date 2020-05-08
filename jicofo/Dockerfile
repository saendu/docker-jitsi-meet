ARG JITSI_REPO=jitsi
FROM ${JITSI_REPO}/base-java

ARG DEBIAN_FRONTEND=noninteractive

RUN \
	apt-get update && \
	apt-get install -y jicofo && \
	apt-get clean

COPY rootfs/ /

VOLUME /config


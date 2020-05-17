ARG JITSI_REPO=jitsi
FROM ${JITSI_REPO}/base

ARG DEBIAN_FRONTEND=noninteractive

RUN	\
	apt-get update && \
	apt-get install -y openjdk-8-jre-headless && \
	apt-get clean


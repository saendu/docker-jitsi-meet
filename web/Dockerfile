ARG JITSI_REPO=jitsi
FROM ${JITSI_REPO}/base

ARG DEBIAN_FRONTEND=noninteractive

COPY rootfs/ /
COPY ./jitsi-meet.tar.bz2 /tmp/install/jitsi-meet.tar.bz2

RUN \
	apt-get update && \
	apt-get install -y software-properties-common && \
	add-apt-repository universe && \
	apt-get install -y cron nginx-extras jitsi-meet-web certbot && \
	mkdir -p /tmp/install && \
	tar -xvf /tmp/install/jitsi-meet.tar.bz2 -C /usr/share/ && \
	apt-get -d install -y jitsi-meet-web-config && \
        dpkg -x /var/cache/apt/archives/jitsi-meet-web-config*.deb /tmp/pkg && \
        mv /tmp/pkg/usr/share/jitsi-meet-web-config/config.js /defaults && \
	mv /usr/share/jitsi-meet/interface_config.js /defaults && \
	apt-get clean && \
	rm -f /etc/nginx/conf.d/default.conf && \
	rm -rf /tmp/pkg /tmp/install /var/cache/apt

EXPOSE 80 443

VOLUME ["/config", "/etc/letsencrypt", "/usr/share/jitsi-meet/transcripts"]

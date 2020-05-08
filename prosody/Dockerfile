ARG JITSI_REPO=jitsi
FROM ${JITSI_REPO}/base

ARG DEBIAN_FRONTEND=noninteractive

ADD https://prosody.im/files/prosody-debian-packages.key /tmp/prosody.key

RUN \
    apt-key add /tmp/prosody.key && \
    rm -f /tmp/prosody.key && \
    echo "deb http://packages.prosody.im/debian focal main" > /etc/apt/sources.list.d/prosody.list && \
    apt-get update && \
    apt-get install -y \
      prosody \
      sasl2-bin \
      luarocks \
      git \
      gcc \
      patch \
      lua-cyrussasl \
      lua-cjson && \
    #TODO: Update luajwtjitsi to use a better ssl lib
    #luarocks install luajwtjitsi 1.3-7 \
    luarocks install net-url 0.9-1

RUN \
    apt-get -d install -y jitsi-meet-prosody && \
    dpkg -x /var/cache/apt/archives/jitsi-meet-prosody*.deb /tmp/pkg && \
    mv /tmp/pkg/usr/share/jitsi-meet/prosody-plugins /prosody-plugins && \
    apt-get clean && \
    rm -rf /tmp/pkg /var/cache/apt

RUN patch -d /usr/lib/prosody/modules/muc -p0 < /prosody-plugins/muc_owner_allow_kick.patch

RUN \
    apt-get remove -y \
      git \
      gcc \
      patch \
      luarocks && \
    apt-get clean && \
    apt-get autoremove -y && \
    rm -rf /etc/prosody

COPY rootfs/ /

EXPOSE 5222 5269 5347 5280

VOLUME ["/config", "/prosody-plugins-custom"]

This is a fork of https://github.com/jitsi/docker-jitsi-meet, please refer to the official doc.

What's different:
* AArch64 (Raspberry Pi 4) support
* JWT not supported
* containers updated to Ubuntu Focal 20.04 (instead of Debian Stretch)
* missing jigasi, etherpad and jibri

How to use it ?
* clone this repo ```git clone https://github.com/amaumene/docker-jitsi-meet.git```
* ```cd docker-jitsi-meet```
* copy sample env file ```cp env.example .env```
* edit the env file, you must at least specify/review:
  - CONFIG
  - HTTP_PORT
  - HTTPS_PORT
  - TZ
  - PUBLIC_URL
  - ENABLE_LETSENCRYPT
  - LETSENCRYPT_DOMAIN
  - LETSENCRYPT_EMAIL
* create the config directories (must match what you have in your .env), by default ```mkdir -p ~/.jitsi-meet-cfg/{web/letsencrypt,transcripts,prosody,jicofo,jvb,jigasi,jibri}```
* generate some passwords ```./gen-passwords.sh```. it will update your .env
* docker-compose up -d
* got to your PUBLIC_URL:HTTP_PORT :)

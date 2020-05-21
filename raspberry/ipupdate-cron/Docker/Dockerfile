FROM blacktr/base

# Install cron
RUN apt-get update && apt-get install -y cron

# Add files
ADD run.sh /run.sh
ADD entrypoint.sh /entrypoint.sh
 
RUN chmod +x /run.sh /entrypoint.sh

RUN \
	apt-get update && \
	apt-get install -y nano ez-ipupdate curl && \
	apt-get clean

ENTRYPOINT /entrypoint.sh
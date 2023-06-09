FROM node:18.16.0-slim

ENV TZ=Asia/Tokyo

WORKDIR /app

### Stop nextjs server at specified time
# COPY ./crontab /etc/crontab

### development
RUN chown -R node:node /app \
    ; \
    \
    apt-get update -y ; \
    apt-get upgrade -y ; \
    apt-get install -y --no-install-recommends \
        anacron \
        cron \
        screen \
        sudo \
    ; \
    apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/* \
    ; \
    \
    usermod -aG sudo node \
    ; \
    \
    echo "" >> /etc/sudoers ; \
    echo "# Don't require password for sudo command for dev user" >> /etc/sudoers ; \
    echo "node ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER node

COPY ./bin/dev-start.sh /app/bin/dev-start.sh
COPY package*.json /app

CMD ["/app/bin/dev-start.sh"]
###

### production
# USE node
# CMD ["/bin/bash", "-c", "npm install && npm run build && npm run start"]
###
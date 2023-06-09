#!/bin/bash

cd /app
npm install

sudo service cron restart
sudo service nginx restart

screen -wipe
screen -dmS server

screen -S server -X stuff ' \
    cd /app; \
    sudo npm run dev \
\n'

sleep infinity
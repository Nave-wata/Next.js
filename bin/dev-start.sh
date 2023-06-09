#!/bin/bash

cd /app
npm install

sudo service cron restart

screen -wipe
screen -dmS server

screen -S server -X stuff ' \
    cd /app; \
    sudo npm run dev \
\n'

sleep infinity
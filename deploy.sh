#!/bin/bash
#/usr/local/bin/docker-compose -f /var/docker/text-track-service/docker-compose.yml down -v
sudo systemctl stop tts-docker
cd /var/docker/text-track-service
git pull origin fred
sudo -kS chmod -R a+rX *
sudo systemctl start tts-docker
#/usr/local/bin/docker-compose -f /var/docker/text-track-service/docker-compose.yml up --build -d

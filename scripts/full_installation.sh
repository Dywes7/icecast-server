#!/bin/bash

sudo git clone https://github.com/Dywes7/icecast-server.git /icecast

sudo chmod +x /icecast/scripts/install_docker.sh

sudo /icecast/scripts/install_docker.sh

cd /icecast/

sudo docker compose up -d

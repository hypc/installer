#!/bin/bash

curl -fsSL https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo tee /etc/apt/sources.list.d/pgdg.list <<EOF
deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main
EOF
sudo apt-get update && sudo apt-get install -y postgresql-10 pgadmin4

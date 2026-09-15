#!/usr/bin/env bash
# Runs once when the codespace is created. Installs PostgreSQL from the
# official PostgreSQL apt repository, exactly as postgresql.org/download instructs.
set -e
sudo apt-get update
sudo apt-get install -y curl ca-certificates nano
sudo install -d /usr/share/postgresql-common/pgdg
sudo curl -o /usr/share/postgresql-common/pgdg/apt.postgresql.org.asc --fail https://www.postgresql.org/media/keys/ACCC4CF8.asc
. /etc/os-release
sudo sh -c "echo 'deb [signed-by=/usr/share/postgresql-common/pgdg/apt.postgresql.org.asc] https://apt.postgresql.org/pub/repos/apt $VERSION_CODENAME-pgdg main' > /etc/apt/sources.list.d/pgdg.list"
sudo apt-get update
sudo apt-get install -y postgresql
sudo service postgresql start
echo
echo "PostgreSQL is installed and running. Continue from Step 5 of Lab 1."

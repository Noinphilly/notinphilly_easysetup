#!/bin/bash
export NODEJS_IP="0.0.0.0"
export NODEJS_PORT=8080
export DATABASE_NAME="notinphiladelphia"
export MONGO_DB_URL="mongodb://mongodb.notinphilly.org/"

if [[ $1 ]]; then
    cd install_files/web && git clone $1
    echo "Ansible Vault Requesting Password:"
    read password
    echo ${password} > .password.txt
    ansible-vault ../apiSettings.js decrypt --vault-password-file ./.password.txt
    cp ../apiSettings.js notinphilly/server/config/apiSettings.js
    ansible-vault ../apiSettings.js encrypt --vault-password-file ./.password.txt
    rm -rf ./.password.txt
    mv notinphilly/server/config/serverSettings.js_ notinphilly/server/config/serverSettings.js
    cd .. && docker-compose up
else
    echo "    "
    echo "########## Error ###########    "
    echo "Please enter your git repo(e.g. https://github.com/<myaccount>/<myrepo>"
    echo "create.sh https://github.com/<youraccount>/notinphilly"
    echo "    "
fi

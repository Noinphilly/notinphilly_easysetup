#!/bin/bash

cd install-files && docker-compose down --rmi all
rm -rf web/notinphilly

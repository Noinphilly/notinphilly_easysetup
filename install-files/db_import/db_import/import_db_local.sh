#!/bin/bash

echo "Started importing notinphilly db..."

host=$1
database="notinphiladelphia"
port="27017"

mongoimport -h $host --port $port -d $database -c blocks --file  /db_import/philadelphia/blocks_export.json

mongoimport -h $host --port $port -d $database  -c city --file /db_import/philadelphia/city_export.json

mongoimport -h $host --port $port -d $database -c neighborhoods --file /db_import/philadelphia/neighborhoods_export.json

mongoimport -h $host --port $port -d $database -c roles --file /db_import/philadelphia/roles_export.json

mongoimport -h $host --port $port -d $database -c states --file /db_import/philadelphia/states_export.json

mongoimport -h $host --port $port -d $database -c streets --file /db_import/philadelphia/streets_export.json

mongoimport -h $host --port $port -d $database -c userProfiles --file /db_import/philadelphia/userProfiles_export.json

mongoimport -h $host --port $port -d $database  -c zipcodes --file /db_import/philadelphia/zipcodes_export.json


echo "Finished importing db..." 

#!/bin/bash

docker exec andes_db  mongodump --db andes --gzip --archive=/initial-db.gzip 
docker cp andes_db:/initial-db.gzip ./initial-db.gzip
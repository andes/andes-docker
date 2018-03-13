#!/bin/bash  

docker exec  andes_elastic  curl -XPUT 'http://localhost:9200/andes/' -d '{"settings" : {"index" : { "number_of_shards" : 3, "number_of_replicas" : 2 } } }'
docker cp initial-db.gzip andes_db:/initial-db.gzip
docker exec andes_db mongorestore --gzip --archive=/initial-db.gzip


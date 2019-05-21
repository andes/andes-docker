#!/bin/bash  

#docker exec  andes_elastic  curl -XPUT 'http://localhost:9200/andes/' -d '{"settings" : {"index" : { "number_of_shards" : 3, "number_of_replicas" : 2 } } }'

curl -XPUT 'http://localhost:9200/andes/' -H "Content-Type: application/json" -d '{"settings" : {"index" : { "number_of_shards" : 3, "number_of_replicas" : 2 } } }'
curl -XPUT -H 'Content-Type: application/json' 'http://localhost:9200/andes2/'   -d @andes2-index.json
docker cp initial-db.gzip andes_db:/initial-db.gzip
docker exec andes_db mongorestore --gzip --archive=/initial-db.gzip


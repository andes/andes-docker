#!/bin/bash  
 
curl -XPUT 'http://localhost:9200/andes' -H "Content-Type: application/json" -d @andes2-index.json

docker exec andes_db mongo --eval "rs.initiate();cfg = rs.conf();cfg.members[0].host = 'localhost:27017';rs.reconfig(cfg, {force : true});rs.initiate();"

docker cp initial-db.gzip andes_db:/initial-db.gzip

docker exec andes_db mongorestore --gzip --archive=/initial-db.gzip


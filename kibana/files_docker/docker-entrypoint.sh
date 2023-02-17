#!/bin/bash

#response=""
while [[ $response != "200" ]]; do
  echo "Import Saved Objects: Waiting for Kibana..."
  sleep 5
  response=$(curl -so /dev/null -w "%{http_code}\n" localhost:5601/api/status) 
  if [[ $response = "200" ]]; then
    echo "Import Saved Objects: Kibana ready, starting imports"
    sleep 10
    for file in $(ls /var/tmp/saved_objects/*.ndjson); do
      curl -X POST localhost:5601/api/saved_objects/_import -H "kbn-xsrf: true" --form file=@${file}
    done
    echo "Import Saved Objects: Imports completed"
  fi
done &

exec /usr/local/bin/kibana-docker

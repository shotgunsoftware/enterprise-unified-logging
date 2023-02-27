#!/bin/bash

while [[ $response != "available" ]]; do
  echo "Import Saved Objects: Waiting for Kibana..."
  sleep 5
  response="$(curl -s localhost:5601/api/status | jq -r .status.core.savedObjects.level)"
  if [[ $response = "available" ]]; then
    echo "Import Saved Objects: Kibana ready, starting imports"
    for file in $(ls /var/tmp/saved_objects/dataviews/*.ndjson); do
      echo "Import Saved Objects: Importing data views $file"
      curl -sX POST localhost:5601/api/saved_objects/_import -H "kbn-xsrf: true" --form file=@${file}
    done
    for file in $(ls /var/tmp/saved_objects/searches/*.ndjson); do
      echo "Import Saved Objects: Importing searches $file"
      curl -sX POST localhost:5601/api/saved_objects/_import -H "kbn-xsrf: true" --form file=@${file}
    done
    for file in $(ls /var/tmp/saved_objects/dashboards/*.ndjson); do
      echo "Import Saved Objects: Importing dashboards $file"
      curl -sX POST localhost:5601/api/saved_objects/_import -H "kbn-xsrf: true" --form file=@${file}
    done
    echo "Import Saved Objects: Imports completed"
  fi
done &

exec /usr/local/bin/kibana-docker

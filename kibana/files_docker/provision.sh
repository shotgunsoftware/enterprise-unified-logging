#!/bin/bash

until $(curl --output /dev/null --silent --head --fail localhost:5601); do
    echo "Waiting for kibana to add saved objects..."
    sleep 5
done

echo "Connected to kibana";

for FILE in `ls /etc/kibana/provision.d/*.json`
do
	curl -XPOST localhost:5601/api/kibana/dashboards/import -H 'kbn-xsrf:true' -H 'Content-type:application/json' -d @${FILE}
done

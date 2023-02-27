FROM docker.elastic.co/kibana/kibana:8.6.1

USER root

RUN apt-get update && \
    apt-get -y install jq && \
    rm -rf /var/lib/apt/lists/*

COPY files_docker/docker-entrypoint.sh /docker-entrypoint.sh

USER kibana

ENTRYPOINT [ "/docker-entrypoint.sh" ]


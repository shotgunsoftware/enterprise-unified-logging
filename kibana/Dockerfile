FROM kibana:8.16.0

USER root

RUN apt-get update && \
    apt-get install -y jq && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY files_docker/docker-entrypoint.sh /docker-entrypoint.sh

USER kibana

ENTRYPOINT [ "/docker-entrypoint.sh" ]


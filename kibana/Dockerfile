FROM docker.elastic.co/kibana/kibana:6.2.4

COPY files_docker/docker-entrypoint.sh /docker-entrypoint.sh
COPY files_docker/provision.sh /provision.sh
COPY files_docker/provision.d /etc/kibana/provision.d

ENTRYPOINT [ "/docker-entrypoint.sh" ]


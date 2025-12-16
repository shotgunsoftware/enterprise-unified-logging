FROM fluent/fluentd:v1.19.0-debian-1.0

USER root

RUN ["gem", "install", "elasticsearch", "--no-document", "--version", "8.16.0"]
RUN ["gem", "install", "fluent-plugin-elasticsearch", "--no-document", "--version", "6.0"]
RUN ["fluent-gem", "install", "fluent-plugin-grok-parser", "--version", "2.6.2"]
RUN mkdir -p /var/log/shotgrid \
    && chmod 666 /var/log/shotgrid

COPY files_docker/patterns /opt/fluentd/patterns/
COPY files_docker/fluent.conf /fluentd/etc/fluent.conf

USER fluent


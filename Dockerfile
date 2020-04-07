FROM openjdk:8
LABEL appname="spring-docs-builder" author="Jinghui Hu"

COPY assets /app
RUN chmod +x /app/build.sh && /app/build.sh

VOLUME /app/spring

ENTRYPOINT "/usr/sbin/entry.sh"

FROM openjdk:8
LABEL author="Jinghui Hu"

COPY assets /assets
RUN chmod +x /assets/setup.sh && /assets/setup.sh

VOLUME /assets/shares

ENTRYPOINT "/assets/entrypoint.sh"

#!/bin/bash
set -e

mv /app/entry.sh /usr/sbin/entry.sh &&
  chmod +x /usr/sbin/entry.sh &&
  mkdir /app &&
  git clone https://github.com/spring-projects/spring-framework.git /app/spring &&
  cd /app/spring &&
  ./gradlew build asciidoctor

SPRING_GIT_REPO=${SPRING_GIT_REPO:="https://github.com/spring-projects/spring-framework.git"}

set -e

log() {
  echo "$(TZ='Asia/Shanghai' date +'%F %T'): $*"
}

log "Cloning source code ..."
git clone -q $SPRING_GIT_REPO /assets/source

log "Building source code ..."
cd /assets/source && chmod +x /assets/entrypoint.sh && \
  ./gradlew build asciidoctor

log "Archiving build docs ..."
ARCNAME=$(TZ='Asia/Shanghai' date +'%Y%m%d_%H%M%S_docs')
ARCFILE=/assets/${ARCNAME}.tar.gz
tar czvf $ARCFILE -C /assets/source/build docs

log "Cleanup caches ..."
rm -rf ~root/.gradle && rm -rf /assets/source

log "Done!"

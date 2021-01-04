SPRING_GIT_REPO=${SPRING_GIT_REPO:="https://github.com/spring-projects/spring-framework.git"}

set -e

log() {
  echo "$(TZ='Asia/Shanghai' date +'%F %T'): $*"
}

chmod +x /assets/entrypoint.sh

log "Cloning source code ..."
git clone -q $SPRING_GIT_REPO /assets/source

log "Building source code ..."
cd /assets/source && \
  ./gradlew build asciidoctor > /assets/gradle.log 2>&1

log "Archiving build docs ..."
ARCNAME=$(TZ='Asia/Shanghai' date +'%Y%m%d_%H%M%S_docs')
ARCFILE=/assets/${ARCNAME}.tar.gz
tar czvf $ARCFILE -C /assets/source/build docs

log "Cleanup caches ..."
rm -rf ~root/.gradle && rm -rf /assets/source

log "Done!"

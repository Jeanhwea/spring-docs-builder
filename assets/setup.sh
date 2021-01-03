SPRING_GIT_REPO=${SPRING_GIT_REPO:="https://github.com/spring-projects/spring-framework.git"}

set -e

log() {
  echo "$(TZ='Asia/Shanghai' date +'%F %T'): $*"
}

log "Cloning source code"
git clone -q $SPRING_GIT_REPO /assets/source

log "Building source code"
cd /assets/source && chmod +x /assets/entrypoint.sh && \
  ./gradlew build asciidoctor >/assets/gradle.log 2>&1

log "Archiving build docs"
FILETAG=$(TZ='Asia/Shanghai' date +'%Y%m%d%H%M%S')
ARCFILE=/assets/${FILETAG}.tar.gz
tar czvf $ARCFILE -C /assets/source/build docs

log "Cleanuping build results"
rm -rf ~root/.gradle && rm -rf /assets/source

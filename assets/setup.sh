SPRING_GIT_REPO=${SPRING_GIT_REPO:="https://github.com/spring-projects/spring-framework.git"}

set -e

echo "Cloning source code"
git clone -q $SPRING_GIT_REPO /assets/source

echo "Building source code"
cd /assets/source && chmod +x /assets/entrypoint.sh && \
  ./gradlew build asciidoctor

echo "Archiving build docs"
FILETAG=$(TZ='Asia/Shanghai' date +'%Y%m%d%H%M%S')
ARCFILE=/assets/${FILETAG}.tar.gz
tar czvf $ARCFILE -C /assets/source/build docs

echo "Cleanuping build results"
rm -rf ~root/.gradle && \
  rm -rf /assets/source

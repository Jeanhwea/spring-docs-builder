SPRING_GIT_REPO=${SPRING_GIT_REPO:="https://github.com/spring-projects/spring-framework.git"}

set -e

echo "Cloning source code"
git clone -q $SPRING_GIT_REPO /assets/source

echo "Building source code"
cd /assets/source && chmod +x /assets/entrypoint.sh && \
  ./gradlew build asciidoctor

echo "Cleanuping build results"
rm -rf ~root/.gradle && \
  mv /assets/source/build /assets/build && \
  rm -rf /assets/source

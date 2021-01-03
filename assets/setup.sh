SPRING_GIT_REPO=${SPRING_GIT_REPO:="https://github.com/spring-projects/spring-framework.git"}

set -e

git clone -q $SPRING_GIT_REPO /assets/source
echo "Successful clone source code"

cd /assets/source && chmod +x /assets/entrypoint.sh && \
  ./gradlew build asciidoctor
echo "Successful build source code"

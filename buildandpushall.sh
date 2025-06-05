echo "Will build taggers with version <$APP_VERSION>. Set APP_VERSION to override this."

./buildall.sh

# Base image
docker push cclkuleuven/taggers-dockerized-base:$APP_VERSION

# Taggers
docker push cclkuleuven/taggers-dockerized-spacy:$APP_VERSION
docker push cclkuleuven/taggers-dockerized-stanza:$APP_VERSION
# docker push cclkuleuven/taggers-dockerized-lettuce:$APP_VERSION
docker push cclkuleuven/taggers-dockerized-lets-nl:$APP_VERSION
docker push cclkuleuven/taggers-dockerized-lets-de:$APP_VERSION
docker push cclkuleuven/taggers-dockerized-lets-fr:$APP_VERSION
docker push cclkuleuven/taggers-dockerized-lets-en:$APP_VERSION
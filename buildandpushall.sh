echo "Will build taggers with version <$APP_VERSION>. Set VERSION_LABEL to override this."

./buildall.sh

# Base image
docker push cclkuleuven/taggers-dockerized-base:$APP_VERSION

# Spacy
docker push cclkuleuven/taggers-dockerized-spacy-nl-lg:$APP_VERSION
docker push cclkuleuven/taggers-dockerized-spacy-en-lg:$APP_VERSION
docker push cclkuleuven/taggers-dockerized-spacy-de-lg:$APP_VERSION
docker push cclkuleuven/taggers-dockerized-spacy-fr-lg:$APP_VERSION
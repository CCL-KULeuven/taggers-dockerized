echo "Will build taggers with version <$APP_VERSION>. Set APP_VERSION to override this."

# Base image
docker build -t cclkuleuven/taggers-dockerized-base:$APP_VERSION base

docker build --build-arg TAG=$APP_VERSION -t cclkuleuven/taggers-dockerized-stanza:$APP_VERSION stanza

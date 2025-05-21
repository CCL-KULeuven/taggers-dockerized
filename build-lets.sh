echo "Will build taggers with version <$APP_VERSION>. Set VERSION_LABEL to override this."

# Base images
docker build -t cclkuleuven/taggers-dockerized-base:$APP_VERSION base


# LETS languages
docker build -t cclkuleuven/taggers-dockerized-lets-nl:$APP_VERSION --build-arg LETS_LANG=nl lets/base
docker build -t cclkuleuven/taggers-dockerized-lets-de:$APP_VERSION --build-arg LETS_LANG=de lets/base
docker build -t cclkuleuven/taggers-dockerized-lets-fr:$APP_VERSION --build-arg LETS_LANG=fr lets/base
docker build -t cclkuleuven/taggers-dockerized-lets-en:$APP_VERSION --build-arg LETS_LANG=en lets/base

echo "Will build taggers with version <$APP_VERSION>. Set APP_VERSION to override this."

# Base image
docker build -t cclkuleuven/taggers-dockerized-base:$APP_VERSION base

# Lettuce languages and variants
docker build -t cclkuleuven/taggers-dockerized-lettuce:$APP_VERSION huggingface/lettuce
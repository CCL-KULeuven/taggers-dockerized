# Set the default label
: ${VERSION_LABEL:=dev}

echo "Will build taggers with version <$VERSION_LABEL>. Set VERSION_LABEL to override this."

# Base image
docker build -t ccl-kuleuven/taggers-dockerized-base:$VERSION_LABEL base

# Lettuce languages and variants
docker build -t ccl-kuleuven/taggers-dockerized-lettuce:$VERSION_LABEL huggingface/lettuce
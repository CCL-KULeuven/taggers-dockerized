# Set the default label
: ${VERSION_LABEL:=1}

echo "Will build taggers with version <$VERSION_LABEL>. Set VERSION_LABEL to override this."

# Base image
docker build -t ccl-kuleuven/taggers-dockerized-base:$VERSION_LABEL base

docker build --build-arg VERSION=$VERSION_LABEL -t ccl-kuleuven/taggers-dockerized-stanza:$VERSION_LABEL stanza

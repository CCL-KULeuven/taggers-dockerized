# Set the default label
: ${VERSION_LABEL:=dev}

echo "Will build taggers with version <$VERSION_LABEL>. Set VERSION_LABEL to override this."

./buildall.sh

# Base image
docker push instituutnederlandsetaal/taggers-dockerized-base:$VERSION_LABEL

# UD-parsers
docker push instituutnederlandsetaal/taggers-dockerized-spacy:$VERSION
docker push instituutnederlandsetaal/taggers-dockerized-stanza:$VERSION


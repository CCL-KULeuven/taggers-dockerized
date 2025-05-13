# Set the default label
: ${VERSION_LABEL:=1}

echo "Will build taggers with version <$VERSION_LABEL>. Set VERSION_LABEL to override this."

# Base image
docker build -t instituutnederlandsetaal/taggers-dockerized-base:$VERSION_LABEL base

# Spacy
docker build --build-arg VERSION=$VERSION_LABEL -t ccl-kuleuven/taggers-dockerized-spacy:$VERSION_LABEL spacy/base

# UD-parsers
docker build --build-arg VERSION=$VERSION_LABEL -t instituutnederlandsetaal/taggers-dockerized-stanza:$VERSION_LABEL stanza

# Lettuce languages and variants
docker build -t ccl-kuleuven/taggers-dockerized-lettuce:$VERSION_LABEL huggingface/lettuce

# LETS languages
#docker build -t instituutnederlandsetaal/taggers-dockerized-lets-nl:$VERSION_LABEL --build-arg LETS_LANG=nl lets/base
#docker build -t instituutnederlandsetaal/taggers-dockerized-lets-de:$VERSION_LABEL --build-arg LETS_LANG=de lets/base
#docker build -t instituutnederlandsetaal/taggers-dockerized-lets-fr:$VERSION_LABEL --build-arg LETS_LANG=fr lets/base
#docker build -t instituutnederlandsetaal/taggers-dockerized-lets-en:$VERSION_LABEL --build-arg LETS_LANG=en lets/base



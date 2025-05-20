echo "Will build taggers with version <$APP_VERSION>. Set VERSION_LABEL to override this."

# Base image
docker build -t cclkuleuven/taggers-dockerized-base:$APP_VERSION base

#docker build -t cclkuleuven/taggers-dockerized-spacy-la-lg:$APP_VERSION spacy/latin
# Spacy languages
docker build -t cclkuleuven/taggers-dockerized-spacy-nl-lg:$APP_VERSION --build-arg SPACY_MODEL=nl_core_news_lg --build-arg TAG=$APP_VERSION spacy/base
docker build -t cclkuleuven/taggers-dockerized-spacy-en-lg:$APP_VERSION --build-arg SPACY_MODEL=en_core_web_lg --build-arg TAG=$APP_VERSION spacy/base
docker build -t cclkuleuven/taggers-dockerized-spacy-de-lg:$APP_VERSION --build-arg SPACY_MODEL=de_core_news_lg --build-arg TAG=$APP_VERSION spacy/base
docker build -t cclkuleuven/taggers-dockerized-spacy-fr-lg:$APP_VERSION --build-arg SPACY_MODEL=fr_core_news_lg --build-arg TAG=$APP_VERSION spacy/base

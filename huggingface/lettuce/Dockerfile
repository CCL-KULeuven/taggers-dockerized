ARG TAG=dev
FROM cclkuleuven/taggers-dockerized-base:$TAG
ARG HUGGINGFACE_MODEL
ENV HUGGINGFACE_MODEL=${HUGGINGFACE_MODEL}
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
COPY dl_all_models.py ./
RUN python dl_all_models.py

# install spacy models for sentence splitting
RUN python -m spacy download en_core_web_sm
RUN python -m spacy download nl_core_news_sm
RUN python -m spacy download de_core_news_sm
RUN python -m spacy download fr_core_news_sm

COPY --link process.py /
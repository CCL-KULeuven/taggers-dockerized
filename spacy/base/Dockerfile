# args only at build time, env also at runtime
ARG TAG=1
FROM cclkuleuven/taggers-dockerized-base:$TAG
ARG SPACY_MODEL
# set runtime env with build time arg
ENV SPACY_MODEL=${SPACY_MODEL}
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
RUN python -m spacy download ${SPACY_MODEL}
COPY --link process.py /
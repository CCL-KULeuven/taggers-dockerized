ARG tag=dev
FROM cclkuleuven/taggers-dockerized-base:$tag
ARG SPACY_MODEL
ENV SPACY_MODEL=la_core_web_lg
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
COPY --link process.py /
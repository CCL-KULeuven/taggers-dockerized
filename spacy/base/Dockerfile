ARG VERSION=dev
FROM ccl-kuleuven/taggers-dockerized-base:$VERSION
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
RUN python -m spacy download en_core_web_lg
RUN python -m spacy download nl_core_news_lg
RUN python -m spacy download de_core_news_lg
RUN python -m spacy download fr_core_news_lg
COPY --link process.py /
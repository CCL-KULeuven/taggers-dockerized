ARG TAG=dev
FROM cclkuleuven/taggers-dockerized-base:$TAG

# Install requirements
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
# Install stanza model
RUN python -c 'import stanza; stanza.download("nl"); stanza.download("en"); stanza.download("fr"); stanza.download("de")'

COPY --link process.py /

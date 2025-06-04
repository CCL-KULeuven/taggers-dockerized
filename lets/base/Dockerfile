ARG TAG=dev
FROM cclkuleuven/taggers-dockerized-base:$TAG
RUN apt-get update && apt-get install -y build-essential gcc g++ python-dev-is-python3 unzip
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
ADD http://www.ccl.kuleuven.be/~jonas/lets-1.0.0/CRF++-0.58.tar.gz /
RUN tar xzvf CRF++-0.58.tar.gz
RUN cd CRF++-0.58/; ./configure
RUN cd CRF++-0.58/; make
RUN cd CRF++-0.58/; make install
RUN cd CRF++-0.58/python; python setup.py build
RUN cd CRF++-0.58/python; python setup.py install
RUN cd CRF++-0.58/python; ldconfig
ADD http://www.ccl.kuleuven.be/~jonas/lets_bugfix.zip /
RUN unzip lets_bugfix.zip -d /
COPY --link process.py /
ARG LETS_LANG
ENV LETS_LANG=${LETS_LANG}
ADD http://www.ccl.kuleuven.be/~jonas/lets-1.0.0/lets_models-1.0.0-${LETS_LANG}.zip /
RUN unzip lets_models-1.0.0-${LETS_LANG}.zip -d / ; rm lets_models-1.0.0-${LETS_LANG}.zip
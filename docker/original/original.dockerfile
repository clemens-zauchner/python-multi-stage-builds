FROM python:3.8-slim-bullseye

RUN apt-get update && \
    apt-get install -y gcc g++ unixodbc-dev

COPY requirements.txt /tmp/requirements.txt

RUN pip3 install --no-cache-dir -r /tmp/requirements.txt


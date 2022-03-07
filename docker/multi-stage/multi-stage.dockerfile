ARG WHEEL_DIST="/tmp/wheels"

FROM python:3.8-slim-bullseye as builder

ARG WHEEL_DIST

RUN apt-get update && \
    apt-get install -y gcc g++ unixodbc-dev

COPY requirements.txt /tmp/requirements.txt

RUN python3 -m pip wheel -w "${WHEEL_DIST}" -r /tmp/requirements.txt


FROM python:3.8-slim-bullseye

ARG WHEEL_DIST

COPY --from=builder "${WHEEL_DIST}" "${WHEEL_DIST}"

WORKDIR "${WHEEL_DIST}"

RUN pip3 --no-cache-dir install *.whl
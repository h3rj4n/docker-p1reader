FROM resnullius/alpine-armv7l:latest
MAINTAINER Herjan van Eijk <docker@f28.nl>

RUN apk --update --no-cache add python3 ca-certificates && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    pip3 install pyserial mysql-connector paho-mqtt && \
    rm -r /root/.cache && \
    mkdir /app

WORKDIR /app

RUN wget https://github.com/h3rj4n/p1reader/archive/master.zip && \
    unzip master.zip

WORKDIR /app/p1reader-master

VOLUME /dev/ttyUSB0

ENTRYPOINT ["python3", "p1reader.py"]

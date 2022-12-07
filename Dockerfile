FROM --platform=linux/amd64 python:3.8
USER root

RUN apt-get update
RUN apt-get -y install locales && \
    localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
ENV TZ JST-9
ENV TERM xterm

WORKDIR /root/src/

COPY requirements.txt /root/src/requirements.txt
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
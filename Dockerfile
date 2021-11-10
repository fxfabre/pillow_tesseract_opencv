FROM jupyter/scipy-notebook:python-3.8.8

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

USER root

RUN apt update \
 && apt-get install -y apt-transport-https software-properties-common \
 && add-apt-repository ppa:alex-p/tesseract-ocr-devel \
 && apt-get update \
 && apt install -y tesseract-ocr-eng \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY ./requirements.txt /app/requirements.txt
RUN pip install --disable-pip-version-check --no-cache-dir -r requirements.txt

USER $NB_USER

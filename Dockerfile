FROM jupyter/scipy-notebook:python-3.8.8

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app

COPY ./requirements.txt /app/requirements.txt
RUN pip install --disable-pip-version-check --no-cache-dir -r requirements.txt

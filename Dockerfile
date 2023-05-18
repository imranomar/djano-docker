# syntax=docker/dockerfile:1
FROM python:3.9-alpine
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
WORKDIR /code
RUN apk add --no-cache --virtual .build-deps gcc musl-dev python3-dev libffi-dev openssl-dev cargo \
    && apk add --no-cache postgresql-dev
COPY requirements.txt /code/
RUN pip install -r requirements.txt
COPY . /code/

####################### NON ALPINE ################################

# syntax=docker/dockerfile:1
#FROM python:3
#ENV PYTHONDONTWRITEBYTECODE=1
#ENV PYTHONUNBUFFERED=1
#WORKDIR /code
#COPY requirements.txt /code/
#RUN pip install -r requirements.txt
#COPY . /code/
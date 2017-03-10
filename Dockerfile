FROM php:5.6-apache

LABEL MAINTAINER="Greg Junge <gregnuj@gmail.com>"

## Install project requirements
RUN apt-get update \
    && apt-get install -y \
    bash \
    curl \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

## Set up project enviroment
ENV PROJECT_NAME="" \
    PROJECT_URL=""

## Create entrypoint
COPY docker-git-entrypoint /usr/local/bin/docker-git-entrypoint
RUN chmod 755 /usr/local/bin/docker-git-entrypoint
ENTRYPOINT ["docker-git-entrypoint"]

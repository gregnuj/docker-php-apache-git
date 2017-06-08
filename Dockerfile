FROM php:5.6-apache

LABEL MAINTAINER="Greg Junge <gregnuj@gmail.com>"

## Install project requirements
RUN apt-get update \
    && apt-get install -y \
    bash curl git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

## Set up project enviroment
ENV \
    PROJECT_REPO="" \
    PROJECT_NAME="" \
    PROJECT_WORKDIR="" \
    PROJECT_APPDIR="" \
    PROJECT_VCS_HOST="" \
    PROJECT_VCS_RSA="" \
    PROJECT_VCS_URL="" \
    PROJECT_VCS_BRANCH="" \

## Create entrypoint
COPY docker-git-entrypoint /usr/local/bin/docker-git-entrypoint

## link .netrc to docker secret netrc
RUN chmod 755 /usr/local/bin/docker-git-entrypoint 

EXPOSE 80
ENTRYPOINT ["/usr/local/bin/docker-git-entrypoint"]
CMD ["apache2-foreground"]

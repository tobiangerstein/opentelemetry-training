# FROM docker:26-dind as base

# ENV PIP_ROOT_USER_ACTION=ignore

# RUN apk update --no-cache
# RUN apk upgrade --no-cache

# RUN apk add --update --no-cache \
#     sudo \
#     bash \
#     curl \
#     build-base \
#     openjdk21-jdk \
#     gradle \
#     maven \
#     python3 \
#     py3-pip \
#     pipx

# RUN pipx ensurepath

ARG DEBIAN_FRONTEND=noninteractive

FROM cruizba/ubuntu-dind as base

RUN apt-get -qq update
RUN apt-get -qq upgrade

RUN apt-get -qq install -y \
    sudo \
    bash \
    curl \
    openjdk-21-jdk \
    gradle \
    maven \
    python3 \
    pip

RUN pip install \
    wheel \
    flask \
    Faker \
    opentelemetry-api \
    opentelemetry-sdk \
    opentelemetry-exporter-prometheus \
    opentelemetry-exporter-otlp \
    opentelemetry-instrumentation-flask

WORKDIR /workspaces/opentelemetry-training

EXPOSE 5000
FROM ruby:latest
WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN gem install bundler
COPY Makefile _config.yml ./
RUN make init
COPY site ./site

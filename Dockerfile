FROM ruby:latest
WORKDIR /app

COPY . .
RUN gem install bundler
RUN make


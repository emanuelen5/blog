FROM ruby:latest
WORKDIR /app

RUN gem install bundler
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY Makefile _config.yml ./
RUN make init
COPY site ./site

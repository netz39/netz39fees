FROM ruby:2.2

ENV RAILS_ENV production

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir -p /app
WORKDIR /app
COPY . /app

RUN bundle install --deployment --without development test
RUN bundle exec rake assets:precompile

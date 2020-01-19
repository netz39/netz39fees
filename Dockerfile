FROM ruby:2.2

ENV RAILS_ENV production

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir -p /app
WORKDIR /app

# First copy the file describing the dependencies. Otherwise, everytime the code
# is changed, bundle install is executed
COPY Gemfile* /app/
RUN bundle install --deployment --without development test

COPY . /app
RUN WITHOUT_APPLICATION_SETTINGS=true bundle exec rake assets:precompile

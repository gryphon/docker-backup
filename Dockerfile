# Base image:
FROM trashtravel/docker-rails:latest

# RUN apt-get update -qq && apt-get install -y build-essential libpq-dev 
RUN apk --update add make g++ mariadb-dev tzdata

RUN mkdir -p /cashier

WORKDIR /cashier

ADD Gemfile /cashier/Gemfile
ADD Gemfile.lock /cashier/Gemfile.lock

RUN bundle install

ADD package.json /cashier/package.json
ADD package-lock.json /cashier/package-lock.json

RUN yarn install

ADD . /cashier

RUN RAILS_ENV=production bundle exec rake assets:precompile

RUN rm -rf /cashier/tmp/* /cashier/log/*

# This is because base image is setting this - needs to be fixed in image
RUN unset VERSION

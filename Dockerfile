FROM ruby:2.5.5
RUN mkdir /code
WORKDIR /code
ADD Gemfile /code/Gemfile
#ADD Gemfile.lock /code/Gemfile.lock
ADD webstop-api.gemspec /code/webstop-api.gemspec
RUN gem install bundler -v '2.0.2'
ENV BUNDLER_VERSION=2.0.2

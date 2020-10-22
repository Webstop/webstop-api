FROM ruby:2.5.5
RUN mkdir /code
WORKDIR /code
ADD Gemfile /code/Gemfile
#ADD Gemfile.lock /code/Gemfile.lock
ADD webstop-api.gemspec /code/webstop-api.gemspec
ENV OAUTH_TOKEN=a6cc6933624efe23227c844748d2a8c1011337d5
RUN gem install bundler -v '2.0.2'
ENV BUNDLER_VERSION=2.0.2

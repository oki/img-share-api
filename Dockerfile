FROM ruby:3.1.1-slim

RUN apt-get update -qq && apt-get install -yq --no-install-recommends \
    build-essential \
    gnupg2 \
    curl \
    less \
    git \
    libpq-dev \
    vim \
    postgresql-client \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV LANG=C.UTF-8 \
  LC_ALL=C.UTF-8 \
  BUNDLE_JOBS=4 \
  BUNDLE_RETRY=3

RUN gem update --system && gem install bundler


ENV app /app
RUN mkdir -p $app
WORKDIR $app
COPY Gemfile /$app/Gemfile
COPY Gemfile.lock /$app/Gemfile.lock
RUN bundle install
ADD . $app
# RUN ls -1 tmp/cache/assets/*
RUN bundle exec rake RAILS_ENV=production assets:precompile

EXPOSE 3000
CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]
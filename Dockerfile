FROM ruby:2.3.0

LABEL maintainer="Erik Reyna"
LABEL maintainer_email="erik.reyna@washpost.com"

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/
RUN bundle install

COPY . /usr/src/app

RUN chmod +x createdb.sh

EXPOSE 3000
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]

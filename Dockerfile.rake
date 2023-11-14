FROM public.ecr.aws/docker/library/ruby:2.7.7

# Throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

# Updating packages
RUN apt update && apt upgrade -yqq

# Set up the app directory
WORKDIR /usr/src/app

# Configure bundler
ENV LANG=C.UTF-8 \
    BUNDLE_JOBS=4 \
    BUNDLE_RETRY=3

# Store Bundler settings in the project's root
ENV BUNDLE_APP_CONFIG=.bundle

# Upgrade RubyGems and install the latest Bundler version
RUN gem update --system && \
    gem install bundler

# Copy over the dependency files
COPY Gemfile .
COPY Gemfile.lock .

# Install dependencies
RUN bundle install

# Copy over the rest of the app
COPY . .

CMD ["bundle", "exec", "rake", "check:all"]

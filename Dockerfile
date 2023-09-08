# syntax=docker/dockerfile:1
FROM ruby:3.1.1
RUN curl -sL https://deb.nodesource.com/setup_12.x  | bash -
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

WORKDIR /share-video
COPY Gemfile /share-video/Gemfile
COPY Gemfile.lock /share-video/Gemfile.lock
RUN bundle install

COPY . /share-video

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]

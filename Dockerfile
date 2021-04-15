FROM ruby:2.7.0-alpine

RUN apk add --update --no-cache build-base curl nodejs yarn libxslt-dev libxml2-dev bash libc6-compat sqlite-dev tzdata && rm -rf /var/cache/apk/*
RUN gem install bundler -v 2.1.4

WORKDIR /app

COPY Gemfile Gemfile.lock /app/
RUN bundle install

COPY package.json yarn.lock /app/
RUN yarn install

COPY . /app

COPY scripts/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]

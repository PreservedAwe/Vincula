FROM ruby:3.2.3-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        sqlite3 \
        libsqlite3-dev \
        curl \
        build-essential && \
    curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g yarn && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /app

COPY . .

RUN bundle install && \
    yarn install --production

ENV RAILS_ENV=production

RUN rake assets:precompile 

RUN groupadd -r tempGroup

RUN useradd -r -g tempGroup -m tempUser

RUN chown -R tempUser:tempGroup /app

USER tempUser

CMD ["rails", "server", "-b", "0.0.0.0", "-p", "4000"]

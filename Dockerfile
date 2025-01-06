FROM ruby:3.2.3

RUN apt-get update && \
    apt-get install -y sqlite3 libsqlite3-dev curl && \
    curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs=20.11.1-1nodesource1 && \
    npm install -g yarn@1.22.21 && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

RUN bundle install
RUN yarn install

RUN rake assets:precompile



CMD ["rails", "server", "-b", "0.0.0.0", "-e", "production"]
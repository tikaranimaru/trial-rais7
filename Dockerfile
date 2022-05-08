FROM ruby:2.7.2

ENV BUNDLER_VER='2.1.4' \
    LANG=C.UTF-8 \
    TZ=Asia/Tokyo

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       apt-utils \
       sudo \
       vim
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN curl -fsSL https://deb.nodesource.com/setup_12.x | sudo -E bash - \
    && curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/yarnkey.gpg >/dev/null \
    && echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | sudo tee /etc/apt/sources.list.d/yarn.list \
    && sudo apt-get update \
    && sudo apt-get install -y nodejs yarn

WORKDIR /tmp
RUN gem install bundler -v $BUNDLER_VER
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install

COPY package.json yarn.lock ./
RUN yarn install --check-files

ENV APP_HOME /app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
ADD . $APP_HOME

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]

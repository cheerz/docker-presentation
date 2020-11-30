FROM ruby:2.6.6
ENV INSTALL_PATH /komposite
ENV RAILS_ENV development

RUN apt-get update \
  && apt-get upgrade -y \
  && apt-get install -y libpq-dev \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /komposite
RUN gem install bundler:2.0.2

COPY Gemfile Gemfile.lock ./
RUN bundle config build.nokogiri --use-system-libraries && \
bundle config set frozen 'true' && \
bundle config set without 'development' && \
bundle install --jobs=4 --retry=3
COPY . .

EXPOSE 3000
CMD ["bin/rails", "s", "-b", "0.0.0.0"]
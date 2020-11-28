FROM ruby:2.7.0
ENV INSTALL_PATH /rubyApp
ARG BUNDLE_INSTALL_FROZEN='true'

WORKDIR /rubyApp

RUN gem install bundler:2.1.4

COPY Gemfile Gemfile.lock ./

RUN bundle config build.nokogiri --use-system-libraries && \
bundle config set frozen "$BUNDLE_INSTALL_FROZEN" && \
bundle check || \
bundle install --jobs=4 --retry=3


EXPOSE 3000

CMD ["bundle", "exec", "puma"]
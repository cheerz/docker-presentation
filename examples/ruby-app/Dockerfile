FROM docker.pkg.github.com/cheerz/cheerz-ruby-docker-image/ruby:2.6.6
ENV INSTALL_PATH /komposite
ENV RAILS_ENV production

WORKDIR /komposite
RUN gem install bundler:2.0.2

COPY Gemfile Gemfile.lock ./
RUN bundle config build.nokogiri && \ 
bundle check || bundle install --frozen --jobs=4 --retry=3 --without development
COPY . .

EXPOSE 3000
CMD ["bin/rails", "s", "-b", "0.0.0.0"]
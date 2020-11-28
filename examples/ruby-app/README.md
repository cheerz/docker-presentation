# README
docker run --rm --name build-rails-app -it -v $(pwd):/rubyApp ruby:2.7.2-buster bash -c "cd /rubyApp && bundle install && bundle exec rake webpacker:install"
docker build -t rails-app .

docker run --rm  --name test-rails-app -it -p 3000:3000 -v $(pwd):/rubyApp rails-app:latest

# README

docker build -t ruby-app .

docker run --rm  --name test-ruby-app -it -p 3000:3000 ruby-app:latest
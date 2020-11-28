# README
docker build -t rails-app .

docker run --rm  --name test-rails-app -it -p 3000:3000 -v $(pwd):/rubyApp rail-app:latest

# README
docker build -t nodejs-app .

docker run --rm  --name test-nodejs-app -it -p 3000:3000 nodejs-app:latest

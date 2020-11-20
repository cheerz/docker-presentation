.PHONY: debug restart clean

start:build run
restart:clean run
update:clean build run

build:
	@docker build -t docker-presentation .

run:
	@docker run -v $(CURDIR)/:/var/www --rm --name dockerPrez -p 8080:80 -d docker-presentation

clean:
	@docker kill dockerPrez
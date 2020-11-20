.PHONY: debug restart clean

build:
	@docker build -t docker-presentation .

run:
	@docker run -v $(CURDIR)/:/var/www --rm --name dockerPrez -p 8080:80 -d docker-presentation

restart:clean run

update:build clean run

clean:
	@docker kill dockerPrez
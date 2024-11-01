build:
	docker-compose -f srcs/docker-compose.yml build

up:
	docker-compose -f srcs/docker-compose.yml up -d

down:
	docker-compose -f srcs/docker-compose.yml down

restart:
	docker-compose -f srcs/docker-compose.yml down && docker-compose -f srcs/docker-compose.yml up -d

logs:
	docker-compose -f srcs/docker-compose.yml logs -f
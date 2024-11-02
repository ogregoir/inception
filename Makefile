VOM = /home/ogregoir/data/mariadb
VOW = /home/ogregoir/data/wordpress

build:

	@if [ ! -d "$(VOM)" ]; then \
		echo "Creating directory $(VOM)"; \
		mkdir -p $(VOM); \
	else \
		echo "Directory $(VOM) already exists"; \
	fi
	@if [ ! -d "$(VOW)" ]; then \
		echo "Creating directory $(VOW)"; \
		mkdir -p $(VOW); \
	else \
		echo "Directory $(VOW) already exists"; \
	fi
	docker compose -f srcs/docker-compose.yml build
	docker compose -f srcs/docker-compose.yml up -d

up:
	docker compose -f srcs/docker-compose.yml up -d

down:
	docker compose -f srcs/docker-compose.yml down

restart:
	docker compose -f srcs/docker-compose.yml down && docker-compose -f srcs/docker-compose.yml up -d

logs:
	docker compose -f srcs/docker-compose.yml logs -f

clean:
	docker compose -f srcs/docker-compose.yml down -v
	docker system prune -a -f 
	@if [ -d "$(VOW)" ]; then \
		rm -rf $(VOW); \
	fi
	@if [ -d "$(VOM)" ]; then \
		rm -rf $(VOM); \
	fi
name = Inception

all:
	@printf "Launching configuration ${name}...\n"
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

build:
	@printf "Building configuration ${name}...\n"
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

down:
	@printf "Stopping configuration ${name}...\n"
	@docker-compose -f ./srcs/docker-compose.yml down

re:
	@printf "Rebuilding configuration ${name}...\n"
	@docker-compose -f ./srcs/docker-compose.yml up -d -build

clean: down
	@printf "Cleaning configuration ${name}...\n"
	@docker system prune -a

fclean:
	@printf "Full cleaning all configurations of docker\n"
	@docker stop $$(docker ps -qa)
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force

.PHONY : all build down re clean fclean

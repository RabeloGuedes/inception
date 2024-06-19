up:
	docker compose -f ./srcs/docker-compose.yml up -d

down:
	docker compose -f ./srcs/docker-compose.yml down

clean: down
	if [ $$(docker volume ls -q | wl -l) -eq 0 ]; then docker volume rm  $$(docker volume ls -q); fi
	if [ $$(docker image ls -q | wl -l) -eq 0 ]; then docker image rm  $$(docker image ls -q); fi

fclean:	clean
	docker network prune -f

prune: fclean
	docker system prune -fa

re: prune up


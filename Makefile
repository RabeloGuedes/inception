up:
	mkdir -p $$HOME/data && mkdir -p $$HOME/data/mariadb && mkdir -p $$HOME/data/wordpress
	docker compose -f ./srcs/docker-compose.yml up -d

down:
	docker compose -f ./srcs/docker-compose.yml	down

clean: down
	if [ $$(docker volume ls -q | wc -l) -gt 0 ]; then docker volume rm -f $$(docker volume ls -q); fi
	if [ $$(docker image ls -q | wc -l) -gt 0 ]; then docker image rm -f $$(docker image ls -q); fi

fclean:	clean
	docker network prune -f

prune: fclean
	docker system prune -fa
	sudo rm -rf $$HOME/data/mariadb $$HOME/data/wordpress

re: prune up


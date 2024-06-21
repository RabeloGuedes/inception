up:
	mkdir -p /home/arabelo/data && mkdir -p /home/arabelo/data/mariadb && mkdir -p /home/arabelo/data/wordpress
	docker compose -f ./srcs/docker-compose.yml \
	-f ./srcs/requirements/mariadb/conf/mariadb-compose.yml \
	up -d

down:
	docker compose -f ./srcs/docker-compose.yml \
	-f ./srcs/requirements/mariadb/conf/mariadb-compose.yml \
	down

clean: down
	if [ $$(docker volume ls -q | wl -l) -eq 0 ]; then docker volume rm -f $$(docker volume ls -q); fi
	if [ $$(docker image ls -q | wl -l) -eq 0 ]; then docker image rm -f $$(docker image ls -q); fi

fclean:	clean
	docker network prune -f

prune: fclean
	docker system prune -fa
	rm -rf /home/arabelo/data/mariadb /home/arabelo/data/wordpress

re: prune up


FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y && apt-get install mariadb-server -y

COPY ./conf/db-conf.sh /

RUN chmod +x /db-conf.sh

ENTRYPOINT [ "./db-conf.sh" ]

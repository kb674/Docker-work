#!bin/bash
docker rm -f nginx mysql flask-app

docker rmi -f trio-app
docker rmi -f trio-db

docker network rm trio-network

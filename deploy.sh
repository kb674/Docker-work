#!/bin/bash

# create the network
docker network create  trio-network

# create images of db and flaskapp
docker build -t trio-db db
docker build -t trio-app flask-app

# run the db container
docker run -d --name mysql --network trio-network trio-db

# run the flask app container
docker run -d --name flask-app --network trio-network trio-app

# run a nginx container
docker run -d --network trio-network --mount type=bind,source=$(pwd)/nginx/nginx.conf,target=/etc/nginx/nginx.conf -p 80:80 --name nginx nginx:alpine

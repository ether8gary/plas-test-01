#!/bin/sh
#Docker Container Deployment

#Checkout Container Code (to use script independantly from repository)
#git clone https://github.com/ether8gary/plas-test-01.git

#Build Docker container
docker build -t tulasi:v1 . && wait

#Configure container to open port 80 for nginx to server website
docker run -d -p 80:80 tulasi:v1

#Test that container and website are functioning
hostname="localhost"
if curl -s $hostname | grep "Hello World!"
then
  echo "Website is Up"
else
  echo "Website is down"
fi

#Tag docker image with containerID and push to private docker hub
#alias tag_container="docker ps -l -q"
#container=`tag_container`
#private_docker=
#docker tag $container $private_docker

#Tag docker image and push to remote dockerhub
docker tag 621ae34ddd2a tulasi465/task:v1

#Push to DockerHub
docker push tulasi465/task:v1

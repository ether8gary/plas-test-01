#!/bin/sh
#Docker Container Deployment

#Checkout Container Code (to use script independantly from repository)
#git clone https://github.com/ether8gary/plas-test-01.git

#Build Docker container
sudo docker build -t tulasi:v1 . && wait

#Configure container to open port 80 for nginx to server website
sudo docker run -d -p 80:80 tulasi:v1

#Test that container and website are functioning
hostname="localhost"
if curl -s $hostname | grep "Hello World!"
then
  echo "Website is Up"
else
  echo "Website is down"
fi

#Tag docker image with remote respository and push to dockerhub
container="docker ps -l -q"
sudo docker tag $container tulasi465/task:v1 && sudo docker push tulasi465/task:v1

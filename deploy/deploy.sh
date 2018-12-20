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

#Tag docker image with remote respository and push to dockerhub
alias tag_container='docker ps -l -q'
sudo docker tag `tag_container` tulasi465/task:v1 && sudo docker push tulasi465/task:v1

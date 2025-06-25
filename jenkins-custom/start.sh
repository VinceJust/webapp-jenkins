#!/bin/bash

docker build -t my-jenkins-node .

docker stop my-simple-jenkins 2>/dev/null || true
docker rm -v my-simple-jenkins 2>/dev/null || true

docker run --name my-simple-jenkins \
  -p 8080:8080 \
  -v jenkins_home:/var/jenkins_home \
  my-jenkins-node

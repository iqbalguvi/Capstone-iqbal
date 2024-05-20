#!/bin/bash
if [[ $GIT_BRANCH == "origin/dev" ]]; then
    # Build your project
    sh 'chmod +x build.sh'
    sh './build.sh'
    docker login -u iqbalguvi -p $DOCKER_PASSWORD
    docker tag iqbalguvi iqbalguvi/dev
    docker push iqbalguvi/dev

elif [[ $GIT_BRANCH == "origin/master" ]]; then
    sh 'chmod +x build.sh'
    sh './build.sh'
    docker login -u iqbalguvi -p $DOCKER_PASSWORD
    docker tag iqbalguvi iqbalguvi/prod 
    docker push iqbalguvi/prod
fi

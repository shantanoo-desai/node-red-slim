#!/bin/env bash

TESTCOMPOSEFILE="test-docker-compose.yml"

docker-compose -f $TESTCOMPOSEFILE up -d --build

# Provide time for services to be up
echo "Tests will begin in 5s......"
sleep 5;

pytest . --docker-compose=$TESTCOMPOSEFILE --docker-compose-no-build --use-running-containers -v

docker-compose -f $TESTCOMPOSEFILE down
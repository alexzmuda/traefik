#!/usr/bin/env bash
docker network remove myroutemap
docker network create myroutemap
docker-compose -f docker-compose.yml build
docker-compose -f docker-compose.yml up --force-recreate
#!/usr/bin/env bash
docker network create myroutemap
docker-compose -f docker-compose.yml up -d
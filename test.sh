#!/bin/bash
sudo docker compose up -d
sudo docker exec -i docker-tesis-db-1 mysql -uuser -puserpassword testdb < test.sql

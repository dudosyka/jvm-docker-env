#!/bin/bash
# Chose one of them:
# /home/wait-for-it.sh maria:3306 -s -t 60
# /home/wait-for-it.sh postgres:5432 -s -t 60
java -jar -Xmx7g /opt/application/app.jar
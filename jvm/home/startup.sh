#!/bin/bash
/home/wait-for-it.sh maria:3306 -s -t 60
java -jar /opt/application/app.jar
#!/bin/bash
/home/wait-for-it.sh jvm:8080 -s -t 60
nginx -g "daemon off;"
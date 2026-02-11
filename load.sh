#!/bin/bash

APP_URL="http://SERVER_A_IP:8000"
BASE_QPS=(5 10 20 40 15 8 25 12)
WINDOW=300

while true; do
  for QPS in "${BASE_QPS[@]}"; do
    JITTER=$((RANDOM % 5))         
    FINAL_QPS=$((QPS + JITTER))

    echo "Running at ${FINAL_QPS} QPS"
    hey -z ${WINDOW}s -q $FINAL_QPS $APP_URL
  done
done

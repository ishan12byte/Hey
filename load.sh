#!/bin/bash

APP_URL="http://SERVER_A_IP:8000"

# SAFE QPS LEVELS for single-worker tiny instance
BASE_QPS=(2 3 4 5 3 2)

# Short bursts (long tests kill CPU credits)
WINDOW=20

while true; do
  for QPS in "${BASE_QPS[@]}"; do

    # Small jitter (keeps traffic realistic)
    JITTER=$((RANDOM % 2))
    FINAL_QPS=$((QPS + JITTER))

    echo "Running at ${FINAL_QPS} QPS"

    # CRITICAL: Concurrency = 1 (single worker system)
    hey -z ${WINDOW}s -q $FINAL_QPS -c 1 $APP_URL

    # CRITICAL: Recovery time (lets CPU credits breathe)
    sleep 8

  done
done

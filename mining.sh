#!/bin/bash

for (( ; ;  ))
do
    curl http://127.0.0.1:28081/start_mining -d '{"do_background_mining":false,"ignore_battery":true,"miner_address":"9wviCeWe2D8XS82k2ovp5EUYLzBt9pYNW2LXUFsZiv8S3Mt21FZ5qQaAroko1enzw3eGr9qC7X1D7Geoo2RrAotYPwq9Gm8","threads_count":1}' -H 'Content-Type: application/json';

    echo "start mining"
    sleep 30s

    curl http://127.0.0.1:28081/stop_mining -H 'Content-Type: application/json'

    echo "stop mining"
    sleep 15s
done

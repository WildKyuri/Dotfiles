#!/bin/bash

USAGE=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits)

echo "󰢮 $USAGE%"

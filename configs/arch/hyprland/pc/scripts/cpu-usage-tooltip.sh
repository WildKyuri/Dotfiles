#!/bin/bash

CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')

printf '{"text":" ","tooltip":"CPU: %.0f%%"}\n' "$CPU"

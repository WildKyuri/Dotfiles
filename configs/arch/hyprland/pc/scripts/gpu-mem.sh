#!/bin/bash

VRAM=$(nvidia-smi --query-gpu=memory.used,memory.total --format=csv,noheader,nounits)

MEM_USED=$(echo $VRAM | cut -d ',' -f1)
MEM_TOTAL=$(echo $VRAM | cut -d ',' -f2)

echo " $MEM_USED"

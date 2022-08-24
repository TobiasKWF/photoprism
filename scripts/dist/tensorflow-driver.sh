#!/usr/bin/env bash

PATH="/usr/local/sbin:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/bin:/scripts:$PATH"

CPU_DETECTED=$(lshw -c processor -json 2>/dev/null)

##Updated CPU Detection only first CPU in a multi CPU Enviroment 

if [[ $(echo "${CPU_DETECTED}" | jq -r '.[0].capabilities.avx2') == "true" ]]; then
  echo "avx2"
elif [[ $(echo "${CPU_DETECTED}" | jq -r '.[0].capabilities.avx') == "true" ]]; then
  echo "avx"
fi

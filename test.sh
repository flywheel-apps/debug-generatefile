#!/bin/bash

BASE=$(cat manifest.json | jq '.custom."gear-builder".image' | tr -d '"')
echo "BASE is" $BASE

docker run -it --rm \
    --volume "$(pwd):/src" \
    --volume "$(pwd)/gear/config.json:/flywheel/v0/config.json" \
    --volume "$(pwd)/gear/input:/flywheel/v0/input" \
    --volume "$(pwd)/gear/output:/flywheel/v0/output" \
    --entrypoint=/bin/bash "${BASE}"

#!/bin/bash

BASE=$(cat manifest.json | jq '.custom."gear-builder".image' | tr -d '"')
echo "BASE is" $BASE
docker build -f Dockerfile -t "${BASE}" .

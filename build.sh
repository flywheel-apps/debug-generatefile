#!/bin/bash
# Builds the container.
# The container can be exported using the export.sh script
CONTAINER=flywheel/debug-generatefile
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

docker build --no-cache --tag $CONTAINER $DIR

# flywheel/debug-generatefile

# start with ubuntu
FROM ubuntu:trusty
LABEL maintainer="support@flywheel.io"

RUN apt-get update && apt-get -y install jq 

# Make directory for flywheel spec (v0)
ENV FLYWHEEL /flywheel/v0
RUN mkdir -p ${FLYWHEEL}
COPY run ${FLYWHEEL}/run
COPY manifest.json ${FLYWHEEL}/manifest.json

# Set the entrypoint
ENTRYPOINT ["/flywheel/v0/run"]

[![Docker Pulls](https://img.shields.io/docker/pulls/flywheel/debug-generatefile.svg)](https://hub.docker.com/r/flywheel/debug-generatefile/)
[![Docker Stars](https://img.shields.io/docker/stars/flywheel/debug-generatefile.svg)](https://hub.docker.com/r/flywheel/debug-generatefile/)

# debug-generatefile

## Overview
Generates a random binary file with the given size.

## Running

Choose this gear from the Utility Gear menu, set the size of the output in the
configuration and press the "Run Gear" button.

## Inputs

None.

## Config

### size

Size of the output file in MB.  The default is 1000.

## Gear Testing and Development
To build, run `build.sh`

To test, run `test.sh`.  This will drop you into a shell in the running container
as if you are in the running gear.  Run the gear with

`cd /flywheel/v0/ ; ./run`

Because `gear/config.json` is mounted in the container as `config.json`, you can
edit it in another terminal window outside the container and then re-run the gear.

If you want to edit the `run` script outside the container and run it inside the
container without stopping to re-build the container, just `cd /src` inside the
container and then `./run`.

How does this work?  The current directory is mounted as `/src` and the `gear/` directory 
is mounted inside the container to look like a running gear:

```shell
docker run -it --rm \
    --volume "$(pwd):/src" \
    --volume "$(pwd)/gear/config.json:/flywheel/v0/config.json" \
    --volume "$(pwd)/gear/input:/flywheel/v0/input" \
    --volume "$(pwd)/gear/output:/flywheel/v0/output" \
    --entrypoint=/bin/bash "${BASE}"
```

If you do run the gear inside `/src`, you probably should run `./cleanup.sh` to remove
the large useless output file.

Why would you want to do this?  Because you can quickly test the gear as you create it.
Since you are testing from inside the container, you can see exactly what is in the
container (what packages are installed or missing) and can see the gear output.  You
can do this without having to upload the gear to see what happens and without waiting
to re-build the gear after each change.

One major difference between this simulated gear and a real gear is the environment.
The real gear executed on a Flywheel platform is run using `runc` and *not* `docker run` 
so it does not have the environment variables set as they are in the simulated gear.
To fix this, type `env` inside the container and add any necessary environment variables
to the manifest "environment" attribute.  Also, be sure to set the `PATH` correctly so
the desired executable can be found inside the container.

To upload your gear, log in to your flywheel site using the CLI, and then run `./upload.sh`

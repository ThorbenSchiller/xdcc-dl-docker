# XDCC Docker
This repository provides a Docker image for the python command line tool https://github.com/namboy94/xdcc-dl.

The entrypoint of this image is the `xdcc-dl` command.

## Example
You can use the following docker command:

```shell script
docker run --rm -v "${pwd}/output:/output" -w /output ghcr.io/thorbenschiller/xdcc-dl-docker "/msg CR-HOLLAND|NEW xdcc send #3626"
```

Using a compose file:
```yaml
version: '3'
services:
  codegen:
    image: ghcr.io/thorbenschiller/xdcc-dl-docker
    working_dir: /output
    volumes:
      - ./output:/output
    command: ["/msg CR-HOLLAND|NEW xdcc send #3626"]
```

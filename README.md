# Racket in Jupyter Notebook

This is the repository for Docker image which comes with preinstalled [Jupyter Notebook](https://jupyter.org/), [Racket](https://racket-lang.org/) and [IRacket](https://docs.racket-lang.org/iracket/index.html).

Base image is [jupyter/minimal-notebook](https://hub.docker.com/r/jupyter/minimal-notebook).

Find Docker image on Docker Hub: https://hub.docker.com/r/keeperror/jupyter-racket

## Usage example

### With Docker run command

```sh
docker run --rm -p 8888:8888 -v $PWD:/home/jovyan/pwd --name jupyter-racket keeperror/jupyter-racket jupyter lab --ServerApp.token=''
```

### With Docker Compose
```yaml
version: '3'
services:
  jupyter-racket:
    image: keeperror/jupyter-racket
    ports:
      - "8888:8888"
    volumes:
      - "${PWD}:/home/jovyan/work"
```
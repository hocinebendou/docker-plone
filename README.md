# docker-plone
Plone on Docker

## Install Python
```
1. Rename Dockerfile_python to Dockerfile
2. docker build -t user/python .
3. Rename this Dockerfile to it's initial name
```
## Building container
```
$ docker build -t user/docker-plone .
```

## Running container
```
$ docker run -d -p 8080:8080 --name plone user/docker-plone
```

**Still to be updated...**

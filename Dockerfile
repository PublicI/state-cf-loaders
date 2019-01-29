FROM publicintegrity/loader:latest

# https://github.com/nodejs/docker-node/blob/master/6/onbuild/Dockerfile
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY . /usr/src/app

ENTRYPOINT ["bash"]

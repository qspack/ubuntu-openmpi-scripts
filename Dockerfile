ARG DOCKER_REGISTRY=docker.io
ARG DOCKER_REPO=qspack
ARG FROM_IMG_NAME="ubuntu-openmpi"
ARG FROM_IMG_TAG="latest"
ARG FROM_IMG_HASH=""
FROM ${DOCKER_REGISTRY}/${DOCKER_REPO}/${FROM_IMG_NAME}:${FROM_IMG_TAG}${DOCKER_IMG_HASH}

COPY src/hello_mpi.c src/ring.c /usr/local/src/mpi/
RUN apt-get install -y liblz1 lzd \
 && mpicc -o /usr/local/bin/hello /usr/local/src/mpi/hello_mpi.c \
 && mpicc -o /usr/local/bin/ring /usr/local/src/mpi/ring.c

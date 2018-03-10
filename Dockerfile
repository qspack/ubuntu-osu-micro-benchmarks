ARG DOCKER_REGISTRY=docker.io
ARG DOCKER_REPO=qspack
ARG FROM_IMG_NAME="ubuntu-openmpi"
ARG FROM_IMG_TAG="latest"
ARG FROM_IMG_HASH=""
FROM ${DOCKER_REGISTRY}/${DOCKER_REPO}/${FROM_IMG_NAME}:${FROM_IMG_TAG}${DOCKER_IMG_HASH}

ARG OSU_MICRO_BENCHMARKS_VERSION=5.3
ENV SPACK_OSU_MICRO_BENCHMARKS_VERSION=${OSU_MICRO_BENCHMARKS_VERSION}
LABEL qnib.spack.osu-micro-benchmarks.version=${SPACK_OSU_MICRO_BENCHMARKS_VERSION}
RUN /usr/local/src/spack/bin/spack install --no-checksum \
            osu-micro-benchmarks@${SPACK_OSU_MICRO_BENCHMARKS_VERSION} \
            ^hwloc@${SPACK_HWLOC_VERSION} \
            ^openmpi@${SPACK_OPENMPI_VERSION}
RUN groupadd -g 1000 clgrp \
 && useradd -s /bin/false -d /home/cluser -u 1000 -g 1000 cluser

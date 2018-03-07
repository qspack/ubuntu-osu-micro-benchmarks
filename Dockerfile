ARG DOCKER_REGISTRY=docker.io
ARG DOCKER_REPO=qspack
ARG FROM_IMG_NAME="ubuntu-openmpi"
ARG FROM_IMG_TAG="latest"
ARG FROM_IMG_HASH=""
FROM ${DOCKER_REGISTRY}/${DOCKER_REPO}/${FROM_IMG_NAME}:${FROM_IMG_TAG}${DOCKER_IMG_HASH}

ARG OSU_MICRO_BENCHMARKS_VERSION=5.3
ENV OSU_MICRO_BENCHMARKS_VERSION=${OSU_MICRO_BENCHMARKS_VERSION}
LABEL qnib.spack.osu-micro-benchmarks.version=${OSU_MICRO_BENCHMARKS_VERSION}
RUN /usr/local/src/spack/bin/spack install --no-checksum \
            osu-micro-benchmarks@${OSU_MICRO_BENCHMARKS_VERSION} \
            ^hwloc@${HWLOC_VERSION} \
            ^libtool@${LIBTOOL_VERSION} \
            ^openmpi@${OPENMPI_VERSION}

#!/bin/bash -e

apt update
apt install -y libibverbs-dev rdma-core libfdt-dev libexecs-dev libarchive-dev libbsd-dev libjansson-dev libpcap-dev
git submodule update --init --recursive

SPDK_VERSION_MAJOR="$(cat spdk/include/spdk/version.h | grep "#define SPDK_VERSION_MAJOR	" | awk '{print $3}')"
SPDK_VERSION_MINOR="$(cat spdk/include/spdk/version.h | grep "#define SPDK_VERSION_MINOR	" | awk '{print $3}')"
SPDK_VERSION_PATCH="$(cat spdk/include/spdk/version.h | grep "#define SPDK_VERSION_PATCH	" | awk '{print $3}')"
SPDK_VERSION_SUFFIX="$(cat spdk/include/spdk/version.h | grep "#define SPDK_VERSION_SUFFIX	" | awk '{print $3}')"
SPDK_VERSION_HASH="$(cd spdk && git rev-parse --short HEAD)"
SPDK_VERSION_UNIXTIME="$(cd spdk && git log -1 --format=%at)"

echo "SPDK_VERSION_MAJOR: " $SPDK_VERSION_MAJOR
echo "SPDK_VERSION_MINOR: " $SPDK_VERSION_MINOR
echo "SPDK_VERSION_PATCH: " $SPDK_VERSION_PATCH
echo "SPDK_VERSION_SUFFIX: " $SPDK_VERSION_SUFFIX
echo "SPDK_VERSION_HASH: " $SPDK_VERSION_HASH
echo "SPDK_VERSION_UNIXTIME: " $SPDK_VERSION_UNIXTIME

echo "SPDK_VERSION_MAJOR=$SPDK_VERSION_MAJOR" >> $1
echo "SPDK_VERSION_MINOR=$SPDK_VERSION_MINOR" >> $1
echo "SPDK_VERSION_PATCH=$SPDK_VERSION_PATCH" >> $1
echo "SPDK_VERSION_SUFFIX=$SPDK_VERSION_SUFFIX" >> $1
echo "SPDK_VERSION_HASH=$SPDK_VERSION_HASH" >> $1
echo "SPDK_VERSION_UNIXTIME=$SPDK_VERSION_UNIXTIME" >> $1

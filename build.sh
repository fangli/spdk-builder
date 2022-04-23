#!/bin/bash -e

source $1

echo "SPDK_VERSION_MAJOR: " $SPDK_VERSION_MAJOR
echo "SPDK_VERSION_MINOR: " $SPDK_VERSION_MINOR
echo "SPDK_VERSION_PATCH: " $SPDK_VERSION_PATCH
echo "SPDK_VERSION_SUFFIX: " $SPDK_VERSION_SUFFIX
echo "SPDK_VERSION_HASH: " $SPDK_VERSION_HASH
echo "SPDK_VERSION_UNIXTIME: " $SPDK_VERSION_UNIXTIME

cd spdk

git apply --ignore-space-change --ignore-whitespace ../patch.diff

./scripts/pkgdep.sh --rdma
./configure --with-rdma --enable-lto --disable-tests --disable-unit-tests --disable-examples
make -j4

cd ..

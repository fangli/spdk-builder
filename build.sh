#!/bin/bash -e

cd spdk

git apply --ignore-space-change --ignore-whitespace ../patch.diff

# Build SPDK

./scripts/pkgdep.sh --rdma
make clean || true
./configure --with-rdma --enable-lto --disable-tests --disable-unit-tests --disable-examples
make -j4

cd ..

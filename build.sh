#!/bin/bash -e

cd spdk

# git apply --ignore-space-change --ignore-whitespace ../patch.diff

# Build SPDK

sudo -E ./scripts/pkgdep.sh --rdma --uring

make clean || true
./configure --with-rdma --with-uring --without-uring-zns --enable-lto --disable-tests --disable-unit-tests --disable-examples
make -j4

cd ..

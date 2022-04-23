#!/bin/bash -e

cd spdk

git apply ../patch.diff

./scripts/pkgdep.sh --rdma
./configure --with-rdma --enable-lto --disable-tests --disable-unit-tests --disable-examples
make -j4

cd ..

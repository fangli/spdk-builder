#!/bin/bash

apt-get install -y libibverbs-dev rdma-core libfdt-dev libexecs-dev libarchive-dev libbsd-dev libjansson-dev libpcap-dev
git submodule update --init --recursive

cd spdk

git apply ../patch.diff

./scripts/pkgdep.sh --rdma
./configure --with-rdma --enable-lto --disable-tests --disable-unit-tests --disable-examples
make -j4

#!/bin/bash -e

apt install -y dpkg

mv spdk/build/bin/nvmf_tgt deb-package/usr/local/bin/nvmf
cd deb-package/

sed -i 's/SPDK_VERSION_MAJOR/'$SPDK_VERSION_MAJOR'/g' DEBIAN/control
sed -i 's/SPDK_VERSION_MINOR/'$SPDK_VERSION_MINOR'/g' DEBIAN/control
sed -i 's/SPDK_VERSION_PATCH/'$SPDK_VERSION_PATCH'/g' DEBIAN/control
sed -i 's/SPDK_VERSION_SUFFIX/'$SPDK_VERSION_SUFFIX'/g' DEBIAN/control
sed -i 's/SPDK_VERSION_HASH/'$SPDK_VERSION_HASH'/g' DEBIAN/control
sed -i 's/SPDK_VERSION_UNIXTIME/'$SPDK_VERSION_UNIXTIME'/g' DEBIAN/control

find ./usr -type f | xargs -I{} md5sum  {} > DEBIAN/md5sums

cd ../

dpkg -b deb-package nvmf-x86_64-${SPDK_VERSION_MAJOR}.${SPDK_VERSION_MINOR}.${SPDK_VERSION_PATCH}_${SPDK_VERSION_UNIXTIME}v${SPDK_VERSION_HASH}.deb

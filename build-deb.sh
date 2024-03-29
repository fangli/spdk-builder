#!/bin/bash -e

echo "SPDK_VERSION_MAJOR: $SPDK_VERSION_MAJOR"
echo "SPDK_VERSION_MINOR: $SPDK_VERSION_MINOR"
echo "SPDK_VERSION_PATCH: $SPDK_VERSION_PATCH"
echo "SPDK_VERSION_SUFFIX: $SPDK_VERSION_SUFFIX"
echo "SPDK_VERSION_HASH: $SPDK_VERSION_HASH"
echo "SPDK_VERSION_UNIXTIME: $SPDK_VERSION_UNIXTIME"

sudo apt install -y dpkg

mkdir -p deb-package/usr/local/bin
mkdir -p deb-package/usr/local/lib/nvmfcli/scripts
mkdir -p deb-package/usr/lib64
mkdir -p deb-package/lib/x86_64-linux-gnu

mv spdk/build/bin/nvmf_tgt deb-package/usr/local/bin/nvmf
cp -rf spdk/scripts/rpc.py deb-package/usr/local/lib/nvmfcli/scripts/
cp -rf spdk/python deb-package/usr/local/lib/nvmfcli/
cp -rf /usr/lib64/liburing* deb-package/lib/x86_64-linux-gnu/
cp -rf /usr/lib64/liburing* deb-package/usr/lib64/

cd deb-package/

sed -i 's/SPDK_VERSION_MAJOR/'$SPDK_VERSION_MAJOR'/g' DEBIAN/control
sed -i 's/SPDK_VERSION_MINOR/'$SPDK_VERSION_MINOR'/g' DEBIAN/control
sed -i 's/SPDK_VERSION_PATCH/'$SPDK_VERSION_PATCH'/g' DEBIAN/control
sed -i 's/SPDK_VERSION_SUFFIX/'$SPDK_VERSION_SUFFIX'/g' DEBIAN/control
sed -i 's/SPDK_VERSION_HASH/'$SPDK_VERSION_HASH'/g' DEBIAN/control
sed -i 's/SPDK_VERSION_UNIXTIME/'$SPDK_VERSION_UNIXTIME'/g' DEBIAN/control

find ./usr -type f | xargs -I{} md5sum  {} > DEBIAN/md5sums

cd ../

sudo chown -R root:root deb-package
sudo -E dpkg -b deb-package nvmf-x86_64-${SPDK_VERSION_MAJOR}.${SPDK_VERSION_MINOR}.${SPDK_VERSION_PATCH}-${SPDK_VERSION_UNIXTIME}v${SPDK_VERSION_HASH}.deb

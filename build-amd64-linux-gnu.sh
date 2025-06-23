set -ex

dir=build
mkdir -p $dir
cd $dir

cmake \
    -DCMAKE_INSTALL_BINDIR=bin/x86_64 \
    -DCMAKE_INSTALL_LIBDIR=lib/x86_64 ..

make -j8
make install
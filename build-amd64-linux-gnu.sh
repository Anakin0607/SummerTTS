set -ex

dir=build
mkdir -p $dir
cd $dir

cmake -DBUILD_SHARED_LIBS=ON ..
make -j8
make install
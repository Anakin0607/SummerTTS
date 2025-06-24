if command -v aarch64-none-linux-gnu-gcc  &> /dev/null; then
  ln -svf $(which aarch64-none-linux-gnu-gcc) ./aarch64-linux-gnu-gcc
  ln -svf $(which aarch64-none-linux-gnu-g++) ./aarch64-linux-gnu-g++
  export PATH=$PWD:$PATH
fi

if ! command -v aarch64-linux-gnu-gcc  &> /dev/null; then
  echo "Please install a toolchain for cross-compiling."
  exit 1
fi

set -ex

dir=build-aarch64-linux-gnu
mkdir -p $dir
cd $dir

if [ $1 ];then
  BUILD_SHARE_LIBS=$1
else 
  BUILD_SHARE_LIBS=ON
fi

cmake \
    -DCMAKE_TOOLCHAIN_FILE=./toolchains/aarch64-linux-gnu.toolchain.cmake \
    -DBUILD_SHARED_LIBS=${BUILD_SHARE_LIBS} ..

make -j8
make install

rm ../aarch64-linux-gnu-*
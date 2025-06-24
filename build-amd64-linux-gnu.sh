set -ex

dir=build
mkdir -p $dir
cd $dir

if [ $1 ];then
  BUILD_SHARED_LIBS=$1
else 
  BUILD_SHARED_LIBS=ON
fi

cmake -DBUILD_SHARED_LIBS=${BUILD_SHARED_LIBS} ..
make -j8
make install
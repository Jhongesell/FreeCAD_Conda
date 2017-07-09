mkdir build -p
cd build 

cmake -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_PREFIX_PATH=$PREFIX \
      -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DBOOST_LIBRARYDIR=$PREFIX/lib \
      -DPYTHON_VERSION_STRING=$PY_VER \
      ../src

make -j4 2>&1 | tee output.txt
make install 
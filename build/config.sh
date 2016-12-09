#!/bin/bash
current_dir=`pwd`
build_dir=$current_dir/build_dir
if ! [ -e  $build_dir ];then
    mkdir -p $build_dir
fi
source_dir=`readlink -f "$current_dir/../source"`

cd $build_dir
$source_dir/configure \
    --prefix=$build_dir \
    --disable-shared \
    --enable-static \
    --with-sysroot=$build_dir \
    --with-zlib=no \
    --with-bzip2=no \
    --with-png=no \
    --with-harfbuzz=no \
    --with-old-mac-fonts \
    --with-fsspec \
    --with-fsref \
    --with-quickdraw-toolbox \
    --with-quickdraw-carbon \
    --with-ats

make && make install

cd -

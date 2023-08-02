#!/usr/bin/env bash

if [ -e build_tmp ] ; then
  echo "build_tmp exists"
  exit
fi
echo mkdir build_tmp
mkdir build_tmp
echo cp manifest.json build_tmp
cp manifest.json build_tmp
echo cd build_tmp
cd build_tmp
echo fw gear upload
/Users/andyworth/Flywheel/bin/16.15.3/fw gear upload
echo cd ..
cd ..
echo rm -rf build_tmp
rm -rf build_tmp

#!/bin/bash

BASEDIR=$(dirname $(realpath install.sh))

# change working directory to vim home
echo "initialize bundles..."

cd ${BASEDIR}
git submodule update --init --recursive

echo "done."

# YouCompleteMe
echo "compile YouCompleteMe"
echo "(NEEDS CMAKE, G++ AND PYTHON-DEVEL PACKAGES)"

YCM_BUILD=${BASEDIR}/build/ycm_build

mkdir -p ${YCM_BUILD}
cd ${YCM_BUILD}

cmake -G "Unix Makefiles" . ${BASEDIR}/bundle/YouCompleteMe/third_party/ycmd/cpp
cmake --build . --target ycm_core

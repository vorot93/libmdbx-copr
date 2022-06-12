#!/bin/bash

set -e

GIT_TAG='v0.11.8'
PKG_NAME='libmdbx'
REPO_URL='https://gitflic.ru/project/erthink/libmdbx.git'

rm -rf ${PKG_NAME}-src
git clone $REPO_URL ${PKG_NAME}-src
cd ${PKG_NAME}-src
git checkout -b ${PKG_NAME}-${GIT_TAG} tags/${GIT_TAG}

# Build specific stuff:
make dist
mv "$(ls ${PKG_NAME}*.tar.gz)" "../amalgamated-sources/${PKG_NAME}-${GIT_TAG}.tar.gz"

cd ..
rm -rf ${PKG_NAME}-src

#!/usr/bin/env bash

set -ex

RELEASE_VERSION=$( cat stembuild-version/version | cut -d '.' -f1-2 )
BIN_DIRS=( stembuild-untested-windows stembuild-untested-linux )

echo Releasing draft stembuild ${RELEASE_VERSION}

for DIR in "${BIN_DIRS[@]}"
do
    PLATFORM=$( echo ${DIR} | cut -d '-' -f3 )
    echo "*** Setting release version of ${PLATFORM} Stembuild ***"
    SOURCE_BINARY=$( find ${DIR} -name stembuild-\* -type f -printf "%f\n" )
    DEST_BINARY=$( echo ${SOURCE_BINARY} | sed -r 's/[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+/'${RELEASE_VERSION}'/g' )
    cp ${DIR}/${SOURCE_BINARY} output/${DEST_BINARY}
done

echo ${RELEASE_VERSION} > output/tag
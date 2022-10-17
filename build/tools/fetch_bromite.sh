#!/bin/bash

START_DIR=$(pwd)
cd ${ANDROID_BUILD_TOP}/vendor/addons/prebuilt/product/priv-app/Bromite

TARGET_ARCH=$1
BROMITE_VERSION_FILE=${TARGET_ARCH}_current_bromite_version.txt
BROMITE_LATEST_TAG=$(curl -s -L https://github.com/bromite/bromite/releases/latest | grep "<title>Release Bromite"| tr -cd '0123456789.\n')

function get_latest_bromite () {
    echo "info: Downloading latest Bromite"
    curl -H 'Accept: application/octet-stream' -L -O https://github.com/bromite/bromite/releases/download/${BROMITE_LATEST_TAG}/${TARGET_ARCH}_ChromePublic.apk
    echo ${BROMITE_LATEST_TAG} > ${BROMITE_VERSION_FILE}
}

if [ -f $BROMITE_VERSION_FILE ]; then
    if [ $(cat ${BROMITE_VERSION_FILE}) = ${BROMITE_LATEST_TAG} ]; then
        echo "info: No need to get latest Bromite"
    else
        get_latest_bromite
    fi
else
    get_latest_bromite
fi

cd ${START_DIR}
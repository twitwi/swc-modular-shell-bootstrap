#!/bin/bash

# delete everything but a few directories of interest
find -mindepth 1 -maxdepth 1 -type f -delete
find -mindepth 1 -maxdepth 2 -type d \
    -not -wholename './bash'   -not -wholename './bash/novice' \
    -not -wholename './shell'  -not -wholename './shell/novice' \
    -not -wholename './novice'n -not -wholename './novice/shell' \
    -exec rm -rf {} +

# copy the content of the given folder in the root, then remove it
all() {
    test -d $1 && cp -rt . $(find $1 -mindepth 1 -maxdepth 1)
    rm -rf $1
}
all bash/novice
all shell/novice
all novice/shell


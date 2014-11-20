#!/bin/bash

find -mindepth 1 -maxdepth 1 -type f -delete

find -mindepth 1 -maxdepth 2 -type d \
    -not -wholename './bash' -not -wholename './shell' -not -wholename './novice' \
    -not -wholename './bash/novice' \
    -not -wholename './shell/novice' \
    -not -wholename './novice/shell' \
    -exec rm -rf {} +

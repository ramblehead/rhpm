#!/bin/bash

# shellcheck disable=SC2034

# shellcheck source=./paths.sh
source "${PRJ_PATH}/paths.sh"

readonly PKG_NAME=vterm
readonly DEP_NAME=ubuntu-18.04

readonly SRC_VERSION=4b94838f # master, 2024-02-05
readonly BLD_VERSION=2024-02-05

readonly BLD_NAME=${BLD_VERSION}_${SRC_VERSION}
readonly STOW_NAME=${PKG_NAME}_${BLD_NAME}

# shellcheck disable=SC2219
NPROC=$(let m=$(nproc)-1; ((m > 0)) && echo $m || echo 1)

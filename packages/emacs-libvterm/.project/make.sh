#!/bin/bash

# https://stackoverflow.com/a/13478622
set -eu
set -o pipefail

SDPATH="$(dirname "${BASH_SOURCE[0]}")"
if [[ ! -d "${SDPATH}" ]]; then SDPATH="${PWD}"; fi
SDPATH="$(cd -P "${SDPATH}" && pwd)"
readonly SDPATH

readonly PRJ_PATH="${SDPATH}"

# shellcheck source=./conf.sh
source "${PRJ_PATH}/conf.sh"

# shellcheck disable=SC2153
cd "${SRC_PATH}/${BLD_DIR_NAME}" && echo + cd "${PWD}"

echo
CMD=(make)
CMD+=("-j${NPROC}")
echo + "${CMD[@]}" && "${CMD[@]}"

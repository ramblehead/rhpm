#!/bin/bash

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
cd "${PKG_PATH}" && echo + cd "$PWD"

CMD=(rm -vrf "${SRC_PATH}")
echo + "${CMD[@]}" && "${CMD[@]}"

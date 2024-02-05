#!/bin/bash

# https://stackoverflow.com/a/13478622
set -eu
set -o pipefail

SDPATH="$(dirname "${BASH_SOURCE[0]}")"
if [[ ! -d "${SDPATH}" ]]; then SDPATH="${PWD}"; fi
SDPATH="$(cd -P "${SDPATH}" && pwd)"
readonly SDPATH

readonly PRJ_PATH="${SDPATH}"
source "${PRJ_PATH}/conf.sh"

cd "${SRC_PATH}" && echo + cd ${PWD}

# discard stuff from last build
CMD=(git reset --hard)
echo + "${CMD[@]}" && "${CMD[@]}"

# Go back to master HEAD
CMD=(git checkout master)
echo + "${CMD[@]}" && "${CMD[@]}"

# delete all of the last build stuff
CMD=(git clean -xdf)
echo + "${CMD[@]}" && "${CMD[@]}"

CMD=(rm -vrf build)
echo + "${CMD[@]}" && "${CMD[@]}"

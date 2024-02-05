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
if [[ ! -d "${SRC_PATH}" || \
      (-d "${SRC_PATH}" && -z "$(ls -A "${SRC_PATH}")") ]];
then
  CMD=(git clone)
  CMD+=(--recursive https://github.com/akermu/emacs-libvterm.git)
  CMD+=("${SRC_PATH}")
  echo + "${CMD[@]}" && "${CMD[@]}"

  echo
  CMD=(git submodule update --recursive --remote)
  echo + "${CMD[@]}" && "${CMD[@]}"

  echo
  CMD=(git fetch --all --tags)
  echo + "${CMD[@]}" && "${CMD[@]}"
else
  cd "${SRC_PATH}"; echo + cd "${PWD}"

  echo
  CMD=(git submodule update --recursive --remote)
  echo + "${CMD[@]}" && "${CMD[@]}"

  echo
  CMD=(git fetch --all --tags)
  echo + "${CMD[@]}" && "${CMD[@]}"
fi

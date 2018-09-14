#!/bin/bash

set -eu
set -o pipefail

DIR="`dirname \"${BASH_SOURCE[0]}\"`"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
source "$DIR/configs"
source "$DIR/paths"
unset DIR

./dependency/"$DEP_NAME"

cd "$SRC_PATH"
git checkout "$SRC_VERSION"

if [[ ! -d "$BLD_PATH" ]]; then
  mkdir "$BLD_PATH"
fi

echo "$BLD_PATH"


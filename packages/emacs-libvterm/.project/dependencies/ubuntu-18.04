#!/bin/bash

set -eu
set -o pipefail

sudo apt update

sudo apt install libtool-bin apt-transport-https

(set -x
 wget --no-check-certificate -O - \
      https://apt.kitware.com/keys/kitware-archive-latest.asc \
      2>/dev/null | sudo apt-key add -)

echo
(set -x
 sudo apt-add-repository 'deb https://apt.kitware.com/ubuntu/ bionic main')

echo
(set -x
 sudo apt-get install kitware-archive-keyring)

echo
(set -x
 sudo apt-key --keyring /etc/apt/trusted.gpg del C1F34CDD40CD72DA)

sudo apt update

sudo apt install cmake

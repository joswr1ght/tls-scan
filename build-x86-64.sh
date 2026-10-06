#!/bin/bash

# Stop at the first failure. Without this a failed bootstrap (e.g. a dependency
# download that 404s or times out) still reaches the final echo and exits 0, so
# callers like the SEC504 Salt state believe the build succeeded and only fail
# later, confusingly, on the missing build-root/bin/tls-scan.
set -e

# download and build all dependent packages
./bootstrap.sh

# configure tls-scan
./configure --prefix=${PWD}/build-root

# make
make
make install

echo '>>> Complete'


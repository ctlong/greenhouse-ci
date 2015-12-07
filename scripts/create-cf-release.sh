#!/usr/bin/env bash

set -ex

cd cf-release
bosh -n cleanup
bosh create release --force --with-tarball --name cf --version 220+dev.`date +"%s"`

#!/bin/bash

# change working directory to vim home
cd $(dirname $(realpath install.sh))

# initialize submodules
git submodule update --init --recursive

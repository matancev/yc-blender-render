#!/usr/bin/env bash

set -euxo pipefail

# Install latest Blender from ppa:savoury1/blender.

sudo add-apt-repository ppa:savoury1/ffmpeg4 -y
sudo add-apt-repository ppa:savoury1/blender -y

sudo apt update

sudo apt install blender -y
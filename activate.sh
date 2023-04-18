#!/bin/sh
sudo apt-get install cpio zstd aria2

. /opt/anaconda/bin/activate
conda activate everydream

DIR="${HOME}/every_dream_2_setup"
mkdir -pv -- "${DIR}"
cd "${DIR}"

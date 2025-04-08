#!/bin/bash
# Exit if any commnad fails
set -euo pipefail

sudo apt install -y curl git unzip xz-utils zip clang cmake ninja-build pkg-config libgtk-3-dev

sudo apt install libc6:amd64 libstdc++6:amd64 lib32z1 libbz2-1.0:amd64

wget https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2024.3.1.14/android-studio-2024.3.1.14-linux.tar.gz

tar -xf android-studio-2024.3.1.14-linux.tar.gz

sudo mv android-studio /usr/bin/

## Flutter {{{
wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.29.2-stable.tar.xz

tar -xf flutter_linux_3.29.2-stable.tar.xz

sudo mv flutter /usr/bin

# Flutter update

echo -e "export PATH=/usr/bin/flutter/bin:\$PATH" >>~/.zshenv

echo "export CHROME_EXECUTABLE=/snap/bin/chromium" >>~/.zshenv

echo "Before running flutter_setup2.sh run: source ~/.zshenv"

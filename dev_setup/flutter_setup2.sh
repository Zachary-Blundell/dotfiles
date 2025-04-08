#!/bin/bash
# Exit if any commnad fails
set -euo pipefail

flutter upgrade
flutter --disable-analytics

yes | flutter doctor --android-licenses

flutter doctor

kitty --hold echo -e "5. Download the SDK Command-line Tools\n\t 1. More Actions > SDK Manager > Android SDK (defualt selection) > SDK Tools\n\t 2. Check the Android SDK Command-line Tools\n\t 3. Hit apply\n 6. Add desktop launcher\n 8. flutter doctor --android-licenses \n" &

cd /usr/bin && ./android-studio/bin/studio.sh

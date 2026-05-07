#!/bin/bash

# script to run the sed commands across BSD sed (default macOS), GNU sed
# (Linux, and brew's gnu-sed on macOS).
# first remove the :8000 part of the http://127.0.0.1:8000 domain
# then replace all http://127.0.0.1 with the domain passed to the script

echo $1

# BSD sed requires `-i ''` (empty backup suffix is mandatory).
# GNU sed wants bare `-i` and treats `''` as the script argument.
# Detect by feature so the script works regardless of which sed is on PATH.
if sed --version >/dev/null 2>&1; then
    sed_inplace=(-i)
else
    sed_inplace=(-i '')
fi

sed "${sed_inplace[@]}" "s/:8000//g" src/manifest.json src/js/background/background.js src/popup.html
sed "${sed_inplace[@]}" "s|http://127.0.0.1|$1|g" src/manifest.json src/js/background/background.js src/popup.html src/inpage-panel.html

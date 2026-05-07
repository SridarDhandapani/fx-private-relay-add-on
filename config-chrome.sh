#!/bin/bash

# script to run the sed commands across BSD sed (default macOS), GNU sed
# (Linux, and brew's gnu-sed on macOS).
# remove "contextMenus" permission (Firefox-only) from manifest.json
# Note: the last permission cannot be "menus" or the JSON file will create a linter error

# BSD sed requires `-i ''` (empty backup suffix is mandatory).
# GNU sed wants bare `-i` and treats `''` as the script argument.
# Detect by feature so the script works regardless of which sed is on PATH.
if sed --version >/dev/null 2>&1; then
    sed_inplace=(-i)
else
    sed_inplace=(-i '')
fi

sed "${sed_inplace[@]}" "/menus/d" src/manifest.json

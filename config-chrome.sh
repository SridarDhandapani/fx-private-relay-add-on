#!/bin/bash

# script to run the sed commands across BSD sed (default macOS), GNU sed
# (Linux, and brew's gnu-sed on macOS).
# remove the "menus" permission (Firefox-only) from manifest.json.
# The pattern is anchored to the exact "menus" token so the "contextMenus"
# line (Chrome's equivalent permission) is left in place.
# Note: "menus" must not be the last entry in the permissions array, or
# removing it would leave a trailing comma and break JSON parsing.

# BSD sed requires `-i ''` (empty backup suffix is mandatory).
# GNU sed wants bare `-i` and treats `''` as the script argument.
# Detect by feature so the script works regardless of which sed is on PATH.
if sed --version >/dev/null 2>&1; then
    sed_inplace=(-i)
else
    sed_inplace=(-i '')
fi

sed "${sed_inplace[@]}" '/^[[:space:]]*"menus"/d' src/manifest.json

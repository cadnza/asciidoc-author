#!/usr/bin/env zsh

# Go to git directory
cd $(git -C $(dirname $0) rev-parse --show-toplevel)

# Package extension
final=./test.vsix
rm $final 2> /dev/null
vsce package -o $final

# Uninstall old extension
extId=cadnza.asciidoc-author
code --uninstall-extension $extId

# Install new extension
code --install-extension $final

#!/bin/bash
# This script enables the firewall on macOS

sudo /usr/bin/defaults write /Library/Preferences/com.apple.alf globalstate -int 1
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on
echo "Firewall has been enabled."

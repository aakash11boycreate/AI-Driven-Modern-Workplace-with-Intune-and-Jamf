#!/bin/bash

# This script enforces FileVault encryption on macOS devices via Jamf Pro.

# Check if FileVault is already enabled
fvStatus=$(fdesetup status)
if [[ $fvStatus == *"FileVault is On."* ]]; then
    echo "FileVault is already enabled."
else
    # Enforce FileVault Encryption
    echo "Enforcing FileVault Encryption..."
    sudo fdesetup enable -user $(whoami) -defer /Library/Keychains/filevault-key.plist
    echo "FileVault encryption enabled. A deferred key will be stored for IT access."
fi

# Report compliance back to Jamf Pro
jamf recon
echo "FileVault policy enforced and compliance reported to Jamf Pro."

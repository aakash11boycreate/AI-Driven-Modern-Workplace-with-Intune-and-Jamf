#!/bin/bash

# Script to enforce Conditional Access policies on macOS devices using Jamf Pro and sync with Intune

# Conditional Access Policy: Ensure device is encrypted with FileVault and runs a compliant OS version

echo "Checking FileVault status..."
fvStatus=$(fdesetup status)

if [[ $fvStatus == *"FileVault is On."* ]]; then
    echo "FileVault is enabled. Device meets encryption requirement."
else
    echo "FileVault not enabled. Enforcing encryption..."
    sudo fdesetup enable -user $(whoami)
fi

# Ensure the macOS version is compliant
minOSVersion="11.0"
currentOSVersion=$(sw_vers -productVersion)

if [[ "$currentOSVersion" < "$minOSVersion" ]]; then
    echo "OS is below the minimum required version. Updating..."
    softwareupdate --install --all
else
    echo "OS version is compliant."
fi

# Sync compliance status with Intune and Jamf Pro
echo "Syncing device compliance with Intune..."
sudo jamf policy -event syncWithIntune

# Report back to Jamf Pro
jamf recon
echo "Conditional Access Policy enforced and compliance status synced."

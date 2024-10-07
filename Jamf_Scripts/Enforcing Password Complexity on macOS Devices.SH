#!/bin/bash

# Enforce password complexity rules on macOS via Jamf Pro.

# Ensure password has minimum 8 characters, one uppercase, one lowercase, one number
pwPolicy="minLength=8, requiresUppercase=1, requiresLowercase=1, requiresNumber=1"

echo "Enforcing password complexity requirements..."
pwpolicy -setglobalpolicy "$pwPolicy"

# Report compliance to Jamf Pro
jamf recon
echo "Password policy enforced and compliance reported to Jamf Pro."

# Define macOS Compliance Policy in Intune and integrate with Jamf Pro for compliance checks.

# Pre-requisite: Ensure Intune and Jamf Pro are integrated.

# Example Script for Intune macOS Compliance Policy via PowerShell
Import-Module Microsoft.Graph.Intune

$compliancePolicy = New-DeviceCompliancePolicy -OperatingSystem 'MacOS'
$compliancePolicy.DeviceThreatProtectionEnabled = $true
$compliancePolicy.DeviceThreatProtectionRequiredSecurityLevel = 'Low'
$compliancePolicy.PasswordRequired = $true
$compliancePolicy.PasswordMinimumLength = 8
$compliancePolicy.EncryptionRequired = $true
$compliancePolicy.OSMinimumVersion = '11.0'

# Save and Apply Policy
Set-DeviceCompliancePolicy -InputObject $compliancePolicy

# Sync Jamf Pro devices to Intune for compliance checks
Invoke-JamfProComplianceSync
Write-Host "macOS Compliance Policy with Jamf Pro Integration Applied."

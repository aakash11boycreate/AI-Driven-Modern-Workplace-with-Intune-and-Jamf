# Define Windows 10/11 Encryption Policy in Intune with AI Monitoring for Threat Protection

# Pre-requisite: Ensure AI threat monitoring service is active on Microsoft 365

$encryptionPolicy = New-DeviceConfigurationPolicy -PolicyType "EndpointProtection" -OS "Windows10"

$encryptionPolicy.BitLockerSettings = @{
    RequireStorageCardEncryption = $true
    RequireStartupPin = $true
}

# Apply BitLocker Encryption Policy
Set-DeviceConfigurationPolicy -InputObject $encryptionPolicy

# AI-Driven Monitoring via Azure Sentinel for Threat Alerts
$aiMonitoring = New-AzSentinelPolicy -OS 'Windows' -Compliance 'BitLockerEncryption'

# Integrate AI-driven Sentinel Monitoring for encrypted devices
Start-AIThreatProtection -Policy $aiMonitoring

Write-Host "Windows Encryption and AI-driven Monitoring Policy Applied Successfully."

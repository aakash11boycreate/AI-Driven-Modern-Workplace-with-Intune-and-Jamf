# Sample Script to create Unified Endpoint Management (UEM) Policy to manage both Windows and macOS via Intune and Jamf Pro

$uemPolicy = New-UEMPolicy -Name "UnifiedManagement" -Platform "Windows, macOS" -EnableComplianceChecks $true

# Enforce device compliance for both platforms
$uemPolicy.Microsoft365Settings = @{
    RequireDeviceCompliance = $true
    EnableConditionalAccess = $true
    EnableEndpointProtection = $true
}

$uemPolicy.JamfProSettings = @{
    EnableComplianceSync = $true
    OSVersionMinimum = '11.0'
    EnableThreatProtection = $true
}

# Apply UEM Policy across devices
Set-UEMPolicy -InputObject $uemPolicy
Write-Host "UEM Policy for Microsoft 365 and Jamf Pro Applied."

# Monitor Device Compliance
Start-DeviceComplianceMonitoring -Policy $uemPolicy

# Force an immediate LAPS password rotation by expiring the current one
$ComputerName = Read-Host "Enter the computer name to force password rotation"

# Set expiration time to 0 - (Now)
Set-LapsADPasswordExpiration -Identity $ComputerName -InDays 0

Write-Host "Password for $ComputerName has been expired." -ForegroundColor Green
Write-Host "The workstation will generate and upload a new password on its next Group Policy refresh." -ForegroundColor Cyan
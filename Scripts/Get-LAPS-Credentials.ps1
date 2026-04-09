# Get the current LAPS password for a specific workstation
$ComputerName = Read-Host "Enter the computer name to retrieve the Admin password"

Write-Host "Searching Active Directory for $ComputerName..." -ForegroundColor Cyan

# Retrieve the LAPS password and expiration date
$LapsInfo = Get-LapsADPassword -Identity $ComputerName

if ($LapsInfo) {
    Write-Host "-------------------------------------------" -ForegroundColor Yellow
    Write-Host "Computer: $($LapsInfo.ComputerName)"
    Write-Host "Password: $($LapsInfo.Password)"
    Write-Host "Expires : $($LapsInfo.PasswordExpiration)"
    Write-Host "-------------------------------------------" -ForegroundColor Yellow
} else {
    Write-Host "No LAPS password found for $ComputerName. Ensure the LAPS GPO is applied." -ForegroundColor Red
}
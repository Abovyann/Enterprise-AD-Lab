Write-Host "Checking AD Services..." -ForegroundColor Cyan
$Services = "ADWS", "DNS", "NTDS", "Netlogon"
foreach ($Service in $Services) {
    Get-Service -Name $Service | Select-Object DisplayName, Status
}

Write-Host "Checking LAPS Password Status..." -ForegroundColor Cyan
Get-ADComputer -Filter * -Properties ms-LAPS-Password | Select-Object Name, ms-LAPS-Password
# 1. Update the AD Schema to support the new Windows LAPS
Update-LapsADSchema

# 2. Grant computers in the Workstations OU permission to write their own passwords
# Replace with your actual OU path
$OUPath = "OU=Workstations,OU=_Corporate,DC=company,DC=local"
Set-LapsADComputerSelfPermission -Identity $OUPath

# 3. Grant the IT Staff group permission to read the LAPS passwords
# In a real company, only admins should have this permission.
Set-LapsADReadPasswordPermission -Identity $OUPath -AllowedPrincipals "company\SG-IT-Staff"

Write-Host "LAPS Schema and Permissions have been successfully configured." -ForegroundColor Green
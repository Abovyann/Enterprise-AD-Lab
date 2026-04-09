# Create the Root OU
New-ADOrganizationalUnit -Name "_Corporate" -Path "DC=company,DC=local"

# Create Sub-OUs
$OUs = "Departments", "Groups", "Workstations", "Admins"
foreach ($OU in $OUs) {
    New-ADOrganizationalUnit -Name $OU -Path "OU=_Corporate,DC=company,DC=local"
}

# Create Department OUs
$Depts = "IT", "HR", "Sales"
foreach ($Dept in $Depts) {
    New-ADOrganizationalUnit -Name $Dept -Path "OU=Departments,OU=_Corporate,DC=company,DC=local"
}

# Create Security Groups
$Groups = "SG-IT-Staff", "SG-HR-Staff", "SG-Sales-Staff", "SG-Admins"
foreach ($Group in $Groups) {
    New-ADGroup -Name $Group -GroupCategory Security -GroupScope Global -Path "OU=Groups,OU=_Corporate,DC=company,DC=local"
}
New-Item -Path "C:\CompanyData" -ItemType Directory

New-SmbShare -Name "CompanyData" -Path "C:\CompanyData" -FullAccess "Everyone"

$Acl = Get-Acl "C:\CompanyData"
$Ar = New-Object System.Security.AccessControl.FileSystemAccessRule("company\SG-IT-Staff", "FullControl", "ContainerInherit,ObjectInherit","None", "Allow")
#Acl.SetAccessRule($Ar)
Set-Acl "C:\CompanyData" $Acl
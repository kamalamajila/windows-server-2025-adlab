<#
.SYNOPSIS
    Creates a new folder and shares it over SMB with basic permissions.
    Mirrors the "New Share Wizard" flow in Server Manager
    (File and Storage Services > Shares).

.NOTES
    Edit $SharePath, $ShareName, and permissions before running.
#>

$SharePath = "C:\Shares\NETLOGON"
$ShareName = "NETLOGON"

# Create the folder if it doesn't exist
New-Item -ItemType Directory -Path $SharePath -Force | Out-Null

# Create the SMB share
New-SmbShare -Name $ShareName -Path $SharePath -FullAccess "Everyone"

# Optional: tighten NTFS permissions after creation, e.g.:
# $acl = Get-Acl $SharePath
# $rule = New-Object System.Security.AccessControl.FileSystemAccessRule("Domain Users","ReadAndExecute","ContainerInherit,ObjectInherit","None","Allow")
# $acl.AddAccessRule($rule)
# Set-Acl $SharePath $acl

Get-SmbShare -Name $ShareName

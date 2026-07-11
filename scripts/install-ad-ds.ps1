<#
.SYNOPSIS
    Installs AD DS role and promotes this server to a new domain controller
    (new forest). Run as Administrator on a fresh Windows Server 2025 install.

.NOTES
    Edit $DomainName and $SafeModePassword before running.
    Server will reboot automatically after promotion.
#>

$DomainName = "yourdomain.local"
$SafeModePassword = (Read-Host -AsSecureString "Enter DSRM (Safe Mode) password")

# Install the AD DS role
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools

# Promote to a domain controller in a new forest
Install-ADDSForest `
    -DomainName $DomainName `
    -SafeModeAdministratorPassword $SafeModePassword `
    -InstallDns:$true `
    -DomainMode "WinThreshold" `
    -ForestMode "WinThreshold" `
    -Force:$true

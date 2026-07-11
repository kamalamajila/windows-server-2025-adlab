<#
.SYNOPSIS
    Installs AD Certificate Services role and configures a standalone
    Enterprise Root CA. Run as Administrator on a domain controller
    (or domain-joined member server) after AD DS is in place.

.NOTES
    Edit $CACommonName before running.
#>

$CACommonName = "YourDomain-Root-CA"

# Install AD CS role with the Certification Authority role service
Install-WindowsFeature -Name AD-Certificate -IncludeManagementTools

# Configure as an Enterprise Root CA
Install-AdcsCertificationAuthority `
    -CAType EnterpriseRootCA `
    -CACommonName $CACommonName `
    -KeyLength 2048 `
    -HashAlgorithmName SHA256 `
    -ValidityPeriod Years `
    -ValidityPeriodUnits 10 `
    -Force

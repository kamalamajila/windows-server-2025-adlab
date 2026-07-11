Windows Server 2025 AD Lab
A homelab environment built in VMware Workstation, covering Active Directory Domain Services (AD DS), Active Directory Certificate Services (AD CS), and File and Storage Services (SMB shares) on Windows Server 2025.
Overview
RoleStatusAD DS (Domain Controller)✅ ConfiguredAD CS✅ InstalledDNS✅ ConfiguredFile and Storage Services✅ ConfiguredSMB Share (NETLOGON)✅ Created
Domain Controller: DOMAIN-CONTROLL
Highlights
Server Manager dashboard — AD DS, DNS, and File and Storage Services all running:
Show Image
AD CS role installed on the domain controller:
Show Image
SMB share (NETLOGON) created successfully:
Show Image
Full step-by-step notes: docs/setup-guide.md
Repo structure
windows-server-2025-adlab/
├── README.md
├── docs/
│   ├── setup-guide.md       # Step-by-step build notes
│   └── images/              # Screenshots from Server Manager
└── scripts/
    ├── install-ad-ds.ps1    # Install & promote AD DS
    ├── install-ad-cs.ps1    # Install AD CS role
    └── create-smb-share.ps1 # Create SMB share
Getting started
See docs/setup-guide.md for the full walkthrough, or run the scripts in scripts/ individually on a fresh Windows Server 2025 VM (as Administrator, in order: AD DS → AD CS → SMB share).
Notes
This is a personal lab environment for learning/testing Windows Server AD infrastructure. Not intended for production use as-is — review and adjust script parameters (domain name, IPs, share paths) before running.

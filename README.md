# Automated-Task-Management-with-PowerShell-
/automated-task-management
├── security_check.ps1
└── README.md


# Automated Task Management with PowerShell

This PowerShell script automates routine security checks on Windows servers, such as checking user permissions, reviewing system logs, and identifying open ports. The aim is to make routine security checks faster and easier for administrators.

## Tasks Performed

### 1. **Check for Administrative Privileges**
The script checks for users with administrative privileges on the system by listing the members of the "Administrators" group.

### 2. **Review Failed Login Attempts**
The script reviews the Windows Security logs for failed login attempts, helping to identify potential brute-force attack attempts or unauthorized access.

### 3. **Check Open Ports**
The script checks for open TCP ports on the system, helping to identify unnecessary services that may be running and could pose a security risk.

## PowerShell Script

```powershell
# security_check.ps1

# Check for users with administrative privileges
Write-Host "Checking for users with administrative privileges..."
$adminGroup = Get-LocalGroupMember -Group "Administrators"
$adminGroup | Select-Object Name, ObjectClass
Write-Host ""

# Check the last 10 failed login attempts
Write-Host "Checking for failed login attempts..."
Get-WinEvent -LogName Security | Where-Object {$_.Id -eq 4625} | Select-Object TimeCreated, Message | Sort-Object TimeCreated -Descending | Select-Object -First 10
Write-Host ""

# Check open ports
Write-Host "Checking for open ports..."
Get-NetTCPConnection | Select-Object LocalAddress, LocalPort, State | Sort-Object LocalPort
Write-Host ""


Usage

    Open PowerShell as an administrator.
    Run the script with the following command: .\security_check.ps1

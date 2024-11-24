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

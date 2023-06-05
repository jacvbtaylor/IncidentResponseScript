Set-Location C:\
$timestamp = Get-Date -Format "MM/dd/yyyy HH:mm:ss"

@(
    "Incident Responder Jacob",
    $timestamp,
    (ipconfig /all),
    (netstat -ano),
    (tasklist),
    (Get-WmiObject -Class Win32_ComputerSystem | Select-Object -ExpandProperty UserName),
    (net user)
) | Out-File -FilePath IR.TXT -Encoding UTF8

Select-String -Path IR.TXT -Pattern "3389"
Select-String -Path IR.TXT -Pattern "svchost"
Select-String -Path IR.TXT -Pattern "administrator"
Select-String -Path IR.TXT -Pattern "Guest"

$hash = Get-FileHash -Path IR.TXT -Algorithm MD5
$hash.Hash | Out-File -FilePath hash.txt -Encoding UTF8

Get-Content -Path hash.txt

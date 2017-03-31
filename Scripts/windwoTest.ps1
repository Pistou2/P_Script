$CallPath = Split-Path $MyInvocation.MyCommand.Path
. $CallPath\LoginWindow.ps1
$login = showLoginWindow $CallPath
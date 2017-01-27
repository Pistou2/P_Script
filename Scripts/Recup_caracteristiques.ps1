
#Connection to the computer
<#USERNAME#>$username = "merkya"
<#PASSWORD#>$password = read-host -assecurestring 
<#TARGET IP#>$targetIp = "127.0.0.1"
<#COMMAND#>$command = 'Get-WmiObject -List *'

#Load the functions
$workingdir = Split-Path $MyInvocation.MyCommand.Path -Parent
. "$workingdir\functions.ps1"

#Initialize the session
$session = createSession  -computerIp $targetIp -username $username -password $password

#send the command
sendCommand -command $command -session $session | Format-Table

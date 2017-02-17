#Connection to the computer
<#USERNAME#>$username = "merkya"
<#PASSWORD#>$password = read-host -Prompt "Mot de Passe" -AsSecureString
<#TARGET IP#>$targetIp = "127.0.0.1"

#Load the function file
$workingdir = Split-Path $MyInvocation.MyCommand.Path -Parent
. "$workingdir\functions.ps1"

#Initialize the session
$session = createSession  -computerIp $targetIp -username $username -password $password <#Password must be a secure string#>


<#COMMAND#>$command = 'Get-WmiObject Win32_VideoController'

#send the command
$commandResult = sendCommand -Command $command <#Script to execute, as a string#> -Session $session <#Previously created session#>

#Simply display the output
$commandResult | Format-Table

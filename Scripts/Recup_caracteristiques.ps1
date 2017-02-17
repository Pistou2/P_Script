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

<#=========================
       Command List 
===========================

Here's a list of command that can be used to get all the required computer specs.   Those needs of course to be integrated into the interface

Computer Name :
$env:COMPUTERNAME

Ram :
Get-WmiObject -Class Win32_OperatingSystem -Property TotalVisibleMemorySize, FreePhysicalMemory

GPU :
Get-WmiObject -Class Win32_VideoController

CPU : 
Get-WmiObject -Class Win32_Processor

Windows version : 
Get-WmiObject -Class Win32_OperatingSystem -Property Description, Caption, OSArchitecture, ServicePackMajorVersion, BuildNumber, Version

#>

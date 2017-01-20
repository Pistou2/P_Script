
#Connection to the computer
<#TODO#>$password = read-host -assecurestring 
$username = "W10-1\merkya"
$cred = new-object -typename System.Management.Automation.PSCredential -argumentlist $username, $password

#Get the computer Name
$targetComputerName = Invoke-Command -ComputerName 127.0.0.1 -ScriptBlock{$env:COMPUTERNAME} -Credential $cred

echo $targetComputerName
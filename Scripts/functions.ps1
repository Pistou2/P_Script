#Create a session to the inputed computer
function createSession($computerIp, $username, $password)
{
    #Create a credential, to connect to the computer
    $cred = new-object -typename System.Management.Automation.PSCredential -argumentlist {$username, $password}

    #Open a session
    $session = New-PSSession -ComputerName $computerIp -Credential $cred

    #return it
    return $session   
}

#Send a Command to the session inputed, and return the result
function sendCommand($command, $session)
{
    #convert the command to a script block
    $command = [ScriptBlock]::Create($command)

    #Execute the command
    return Invoke-Command -Session $session -ScriptBlock $command
}

#Get the name of the computer in the session
function getComputerName($session)
{
	return sendCommand('$env:COMPUTERNAME',$session)
}

#TODO
#Get the total and currently free ram quantity
function getRamInfos($session)
{
	return sendCommand('Get-WmiObject -Class Win32_OperatingSystem -Property TotalVisibleMemorySize, FreePhysicalMemory', $session)
}

#TODO
#Get the GPU infos
function getGPUInfos($session)
{
	return sendCommand('Get-WmiObject -Class Win32_VideoController',$session)
}

#TODO
#Get the CPU infos
function getCPUInfos($session)
{
	return sendCommand('Get-WmiObject -Class Win32_Processor',$session)
}

#TODO
#Get some OS informations
function getOSInfos($session)
{
	return sendCommand('Get-WmiObject -Class Win32_OperatingSystem -Property Description, Caption, OSArchitecture, ServicePackMajorVersion, BuildNumber, Version',$session)
}

#Get Disk informations
#TODO
#http://stackoverflow.com/a/14063729
function getDiskInfos($session)
{
	return sendCommand('Get-WmiObject Win32_LogicalDisk -Filter "DeviceID='C:'" -Property Size,FreeSpace',$session)
}

#Si il vaut 1 on récupère les services qui fonctionne
#Si il vaut 2 on récupère les services arréter
#Si il vaut une autre valeur on récupère tout les services
#Retourne un tableau des services
function getService([int]$status = 0){

switch ($status) 
    { 
        1 {$service = Get-Service | Where-Object {$_.Status -eq "Running"}
           return $service } 
        2 {$service = Get-Service | Where-Object {$_.Status -eq "Stopped"}
           return $service }
        default {$service = Get-Service
           return $service }
    }
}

#Retourne un tableau des groupes
function getUser{

    $user = Get-LocalUser
    return $user;
}

#Retourne un tableau des users
function getGroup{
$group =Get-LocalGroup 
return $group
}
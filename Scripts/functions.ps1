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
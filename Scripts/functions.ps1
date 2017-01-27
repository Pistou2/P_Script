#Create a session to the inputed computer
function createSession($computerIp, $username, $password)
{
    $cred = new-object -typename System.Management.Automation.PSCredential -argumentlist {$username, $password}

    #Open a session
    $session = New-PSSession -ComputerName $computerIp -Credential $cred

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

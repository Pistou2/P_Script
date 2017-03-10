[reflection.assembly]::loadwithpartialname("System.Windows.Forms") | Out-Null
[reflection.assembly]::loadwithpartialname("System.Drawing") | Out-Null

$frmFirst = New-Object System.Windows.Forms.Form

$lblInfo = New-Object System.Windows.Forms.Label
$tbName = New-Object System.Windows.Forms.TextBox
$btnConnect = New-Object System.Windows.Forms.Button
 
$lblInfo.AutoSize = $true
$lblInfo.Location = New-Object System.Drawing.Point(12, 15)
$lblInfo.Name = "lblInfo"
$lblInfo.Size = New-Object System.Drawing.Size(210, 13)
$lblInfo.TabIndex = 0
$lblInfo.Text = "PC à accéder (Adresse IP ou Nom du PC) :"

$tbName.Location = New-Object System.Drawing.Point(226, 12)
$tbName.Name = "tbName"
$tbName.Size = New-Object System.Drawing.Size(184, 20)
$tbName.TabIndex = 1

$btnConnect.Location = New-Object System.Drawing.Point(350, 57)
$btnConnect.Name = "btnConnect"
$btnConnect.Size = New-Object System.Drawing.Size(60, 23)
$btnConnect.TabIndex = 2
$btnConnect.Text = "Connexion"
$btnConnect.UseVisualStyleBackColor = $true

$frmFirst.AutoScaleMode = [System.Windows.Forms.AutoScaleMode]::Font
$frmFirst.ClientSize = New-Object System.Drawing.Size(422, 95)
$frmFirst.Controls.Add($btnConnect)
$frmFirst.Controls.Add($tbName)
$frmFirst.Controls.Add($lblInfo)
$frmFirst.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog
$frmFirst.Name = "frmFirst"
$frmFirst.Text = "Gestion de PC"
$frmFirst.ResumeLayout($false)
$frmFirst.PerformLayout()

$frmFirst.ShowDialog()| Out-Null
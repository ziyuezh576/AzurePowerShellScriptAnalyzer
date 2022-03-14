
$s = New-AzWebAppContainerPSSession -ResourceGroupName "Default-Web-WestUS" -Name "ContosoASP"

Invoke-Command -Session $s -ScriptBlock{Get-Process}

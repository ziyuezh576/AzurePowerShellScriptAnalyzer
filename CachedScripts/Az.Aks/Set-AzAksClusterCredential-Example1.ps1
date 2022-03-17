
$SecPasswd = ConvertTo-SecureString $password -AsPlainText -Force

$Credential = $(New-Object System.Management.Automation.PSCredential ('6f277dd3-e481-4518-8aab-35c31662bad9', $SecPasswd))

Set-AzAksClusterCredential -ResourceGroupName $ResourceGroupName -Name $Name -ServicePrincipalIdAndSecret $Credential -force


$vmssName = <VMSSNAME>

$vmPassword = ConvertTo-SecureString <PASSWORD_HERE> -AsPlainText -Force

$vmCred = New-Object System.Management.Automation.PSCredential(<USERNAME_HERE>, $vmPassword)

New-AzVmss -Credential $vmCred -VMScaleSetName $vmssName

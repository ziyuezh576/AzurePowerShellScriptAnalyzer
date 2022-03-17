
$ResourceGroupName = '<RESOURCE GROUP NAME>';

$vmssName = <VMSSNAME>;

$domainNameLabel = "dnl" + $ResourceGroupName;

$vmPassword = ConvertTo-SecureString <PASSWORD_HERE> -AsPlainText -Force;

$vmCred = New-Object System.Management.Automation.PSCredential(<USERNAME_HERE>, $vmPassword);

$text = "UserData value to encode";

$bytes = [System.Text.Encoding]::Unicode.GetBytes($text);

$userData = [Convert]::ToBase64String($bytes);

New-AzVmss -ResourceGroupName $ResourceGroupName -Name $vmssName -Credential $vmCred -DomainNameLabel $domainNameLabel -Userdata $userData;

$vmss = Get-AzVmss -ResourceGroupName $ResourceGroupName -VMScaleSetName $vmssName -InstanceView:$false -Userdata;

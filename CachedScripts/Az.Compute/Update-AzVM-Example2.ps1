
$resourceGroupName = <Resource Group Name>;

$vmname = <Virtual Machine Name>;

$domainNameLabel = "d1" + $rgname;

$vCPUsCoreInitial = 2;

$vCPUsAvailableInitial = 4;

$vCPUsCore1 = 1;

$vCPUsAvailable1 = 1;

$vmSize = 'Standard_D4s_v4';

$securePassword = <Password> | ConvertTo-SecureString -AsPlainText -Force;  

$user = "user";

$cred = New-Object System.Management.Automation.PSCredential ($user, $securePassword);

$vm = New-AzVM -ResourceGroupName $rgname -Name $vmname -Credential $cred -DomainNameLabel $domainNameLabel -Size $vmSize -vCPUsPerCore $vCPUsCoreInitial -vCPUsAvailable $vCPUsAvailableInitial;

Update-AzVm -ResourceGroupName $rgname -VM $vm -vCPUsAvailable $vCPUsAvailable1 -vCPUsPerCore $vCPUsCore1;

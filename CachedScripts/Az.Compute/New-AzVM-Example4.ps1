
$VMLocalAdminUser = "LocalAdminUser";

$VMLocalAdminSecurePassword = ConvertTo-SecureString "Password" -AsPlainText -Force;

$LocationName = "eastus";

$ResourceGroupName = "MyResourceGroup";

$VMName = 'v' + $ResourceGroupName;

$domainNameLabel = "d1" + $ResourceGroupName;

$Credential = New-Object System.Management.Automation.PSCredential ($VMLocalAdminUser, $VMLocalAdminSecurePassword);

$text = "text for UserData";

$bytes = [System.Text.Encoding]::Unicode.GetBytes($text);

$userData = [Convert]::ToBase64String($bytes);

New-AzVM -ResourceGroupName $ResourceGroupName -Name $VMName -Credential $cred -DomainNameLabel $domainNameLabel -UserData $userData;

$vm = Get-AzVM -ResourceGroupName $ResourceGroupName -Name $VMName -UserData;

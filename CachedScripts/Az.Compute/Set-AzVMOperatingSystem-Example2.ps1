
$SecurePassword = ConvertTo-SecureString "Password" -AsPlainText -Force

$Credential = New-Object System.Management.Automation.PSCredential ("FullerP", $SecurePassword); 

$AvailabilitySet = Get-AzAvailabilitySet -ResourceGroupName "ResourceGroup11" -Name "AvailabilitySet03" 

$VirtualMachine = New-AzVMConfig -VMName "VirtualMachine07" -VMSize "Standard_A1" -AvailabilitySetID $AvailabilitySet.Id

$ComputerName = "ContosoVM122"

$WinRMCertUrl = "http://keyVaultName.vault.azure.net/secrets/secretName/secretVersion"

$TimeZone = "Pacific Standard Time"

$CustomData = "echo 'Hello World'"

$VirtualMachine = Set-AzVMOperatingSystem -VM $VirtualMachine -Windows -ComputerName $ComputerName -Credential $Credential -CustomData $CustomData -WinRMHttp -WinRMHttps -WinRMCertificateUrl $WinRMCertUrl -ProvisionVMAgent -EnableAutoUpdate -TimeZone $TimeZone -PatchMode "AutomaticByPlatform" -EnableHotPatching

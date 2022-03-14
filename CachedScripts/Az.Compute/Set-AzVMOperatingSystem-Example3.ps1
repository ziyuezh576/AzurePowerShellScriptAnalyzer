
$SecurePassword = ConvertTo-SecureString "Password" -AsPlainText -Force

$Credential = New-Object System.Management.Automation.PSCredential ("FullerP", $SecurePassword); 

$AvailabilitySet = Get-AzAvailabilitySet -ResourceGroupName "ResourceGroup11" -Name "AvailabilitySet03" 

$VirtualMachine = New-AzVMConfig -VMName "VirtualMachine07" -VMSize "Standard_A1" -AvailabilitySetID $AvailabilitySet.Id

$ComputerName = "ContosoVM122"

$CustomData = "echo 'Hello World'"

$VirtualMachine = Set-AzVMOperatingSystem -VM $VirtualMachine -Linux -ComputerName $ComputerName -Credential $Credential -CustomData $CustomData -PatchMode "AutomaticByPlatform"

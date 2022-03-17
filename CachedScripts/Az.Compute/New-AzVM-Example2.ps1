
$VMLocalAdminUser = "LocalAdminUser"

$VMLocalAdminSecurePassword = ConvertTo-SecureString "Password" -AsPlainText -Force

$LocationName = "westus"

$ResourceGroupName = "MyResourceGroup"

$StorageAccount = "Mydisk"

$OSDiskName = "MyClient"

$ComputerName = "MyClientVM"

$OSDiskUri = "https://Mydisk.blob.core.windows.net/disks/MyOSDisk.vhd"

$SourceImageUri = "https://Mydisk.blob.core.windows.net/vhds/MyOSImage.vhd"

$VMName = "MyVM"

$VMSize = "Standard_DS3"

$OSDiskCaching = "ReadWrite"

$OSCreateOption = "FromImage"

$DNSNameLabel = "mydnsname" # mydnsname.westus.cloudapp.azure.com

$NetworkName = "MyNet"

$NICName = "MyNIC"

$PublicIPAddressName = "MyPIP"

$SubnetName = "MySubnet"

$SubnetAddressPrefix = "10.0.0.0/24"

$VnetAddressPrefix = "10.0.0.0/16"

$SingleSubnet = New-AzVirtualNetworkSubnetConfig -Name $SubnetName -AddressPrefix $SubnetAddressPrefix

$Vnet = New-AzVirtualNetwork -Name $NetworkName -ResourceGroupName $ResourceGroupName -Location $LocationName -AddressPrefix $VnetAddressPrefix -Subnet $SingleSubnet

$PIP = New-AzPublicIpAddress -Name $PublicIPAddressName -DomainNameLabel $DNSNameLabel -ResourceGroupName $ResourceGroupName -Location $LocationName -AllocationMethod Dynamic

$NIC = New-AzNetworkInterface -Name $NICName -ResourceGroupName $ResourceGroupName -Location $LocationName -SubnetId $Vnet.Subnets[0].Id -PublicIpAddressId $PIP.Id

$Credential = New-Object System.Management.Automation.PSCredential ($VMLocalAdminUser, $VMLocalAdminSecurePassword);

$VirtualMachine = New-AzVMConfig -VMName $VMName -VMSize $VMSize

$VirtualMachine = Set-AzVMOperatingSystem -VM $VirtualMachine -Windows -ComputerName $ComputerName -Credential $Credential -ProvisionVMAgent -EnableAutoUpdate

$VirtualMachine = Add-AzVMNetworkInterface -VM $VirtualMachine -Id $NIC.Id

$VirtualMachine = Set-AzVMOSDisk -VM $VirtualMachine -Name $OSDiskName -VhdUri $OSDiskUri -SourceImageUri $SourceImageUri -Caching $OSDiskCaching -CreateOption $OSCreateOption -Windows

New-AzVM -ResourceGroupName $ResourceGroupName -Location $LocationName -VM $VirtualMachine -Verbose

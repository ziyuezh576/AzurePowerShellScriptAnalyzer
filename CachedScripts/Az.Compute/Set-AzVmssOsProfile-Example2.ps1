
$loc = "eastus";

$rgname = "<Resource Group Name>";

$vmssName = "myVmssSlb";

$vmNamePrefix = "vmSlb";

$vmssInstanceCount = 5;

$vmssSku = "Standard_DS1_v2";

$vnetname = "myVnet";

$vnetAddress = "10.0.0.0/16";

$subnetname = "default-slb";

$subnetAddress = "10.0.2.0/24";

$securePassword = "<Password>" | ConvertTo-SecureString -AsPlainText -Force;  

$cred = New-Object System.Management.Automation.PSCredential ("<Username>", $securePassword);

$frontendSubnet = New-AzVirtualNetworkSubnetConfig -Name $subnetname -AddressPrefix $subnetAddress;

$virtualNetwork = New-AzVirtualNetwork -Name $vnetname -ResourceGroupName $rgname -Location $loc -AddressPrefix $vnetAddress -Subnet $frontendSubnet;

$publicIP = New-AzPublicIpAddress `
    -ResourceGroupName $rgname `
    -Location $loc `
    -AllocationMethod Static `
    -Sku "Standard" `
    -IpAddressVersion "IPv4" `
    -Name "myLBPublicIP";

$frontendIP = New-AzLoadBalancerFrontendIpConfig `
    -Name "myFrontEndPool" `
    -PublicIpAddress $publicIP;

$backendPool = New-AzLoadBalancerBackendAddressPoolConfig -Name "myBackEndPool" ;

$lb = New-AzLoadBalancer `
    -ResourceGroupName $rgname `
    -Name "myLoadBalancer" `
    -Sku "Standard" `
    -Tier "Regional" `
    -Location $loc `
    -FrontendIpConfiguration $frontendIP `
    -BackendAddressPool $backendPool;

Add-AzLoadBalancerProbeConfig -Name "myHealthProbe" `
    -LoadBalancer $lb `
    -Protocol TCP `
    -Port 80 `
    -IntervalInSeconds 15 `
    -ProbeCount 2;

Add-AzLoadBalancerRuleConfig `
    -Name "myLoadBalancerRule" `
    -LoadBalancer $lb `
    -FrontendIpConfiguration $lb.FrontendIpConfigurations[0] `
    -BackendAddressPool $lb.BackendAddressPools[0] `
    -Protocol TCP `
    -FrontendPort 80 `
    -BackendPort 80 `
    -DisableOutboundSNAT `
    -Probe (Get-AzLoadBalancerProbeConfig -Name "myHealthProbe" -LoadBalancer $lb);

Add-AzLoadBalancerOutboundRuleConfig `
    -Name "outboundrule" `
    -LoadBalancer $lb `
    -AllocatedOutboundPort '10000' `
    -Protocol 'All' `
    -IdleTimeoutInMinutes '15' `
    -FrontendIpConfiguration $lb.FrontendIpConfigurations[0] `
    -BackendAddressPool $lb.BackendAddressPools[0];

Set-AzLoadBalancer -LoadBalancer $lb;

$ipConfig = New-AzVmssIpConfig `
    -Name "myIPConfig" `
    -SubnetId $virtualNetwork.Subnets[0].Id `
    -LoadBalancerBackendAddressPoolsId $lb.BackendAddressPools[0].Id `
    -Primary;

$vmssConfig = New-AzVmssConfig `
    -Location $loc `
    -SkuCapacity $vmssInstanceCount `
    -SkuName $vmssSku `
    -OrchestrationMode 'Flexible' `
    -PlatformFaultDomainCount 1;

Set-AzVmssStorageProfile $vmssConfig `
    -OsDiskCreateOption "FromImage" `
    -ImageReferencePublisher "MicrosoftWindowsServer" `
    -ImageReferenceOffer "WindowsServer" `
    -ImageReferenceSku "2022-datacenter-azure-edition-core-smalldisk" `
    -ImageReferenceVersion "latest";  

Set-AzVmssOsProfile $vmssConfig `
    -AdminUsername $cred.UserName `
    -AdminPassword $cred.Password `
    -ComputerNamePrefix $vmNamePrefix `
    -WindowsConfigurationProvisionVMAgent $true `
    -WindowsConfigurationPatchMode "AutomaticByPlatform" `
    -EnableHotpatching;

Add-AzVmssNetworkInterfaceConfiguration `
    -VirtualMachineScaleSet $vmssConfig `
    -Name "network-config" `
    -Primary $true `
    -IPConfiguration $ipConfig `
    -NetworkApiVersion '2020-11-01';

$publicConfig = @{"protocol" = "http"; "port" = 80; "requestPath" = "/healthEndpoint"};

$extensionName = "myHealthExtension";

$extensionType = "ApplicationHealthWindows";

$publisher = "Microsoft.ManagedServices";

Add-AzVmssExtension -VirtualMachineScaleSet $vmssConfig `
    -Name $extensionName `
    -Publisher $publisher `
    -Setting $publicConfig `
    -Type $extensionType `
    -TypeHandlerVersion "1.0" `
    -AutoUpgradeMinorVersion $True;

$vmss = New-AzVmss `
    -ResourceGroupName $rgname `
    -Name $vmssName `
    -VirtualMachineScaleSet $vmssConfig;

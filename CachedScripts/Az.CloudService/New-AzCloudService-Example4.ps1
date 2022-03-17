
$role1 = New-AzCloudServiceRoleProfilePropertiesObject-Name 'ContosoFrontend' -SkuName 'Standard_D1_v2' -SkuTier 'Standard' -SkuCapacity 2

$role2 = New-AzCloudServiceRoleProfilePropertiesObject-Name 'ContosoBackend' -SkuName 'Standard_D1_v2' -SkuTier 'Standard' -SkuCapacity 2

$roleProfile = @{role = @($role1, $role2)}

$publicIp = Get-AzPublicIpAddress -ResourceGroupName ContosOrg -Name ContosIp

$feIpConfig = New-AzCloudServiceLoadBalancerFrontendIPConfigurationObject -Name 'ContosoFe' -PublicIPAddressId $publicIp.Id

$loadBalancerConfig = New-AzCloudServiceLoadBalancerConfigurationObject -Name 'ContosoLB' -FrontendIPConfiguration $feIpConfig

$networkProfile = @{loadBalancerConfiguration = $loadBalancerConfig}

$credential = Get-Credential

$expiration = (Get-Date).AddYears(1)

$rdpExtension = New-AzCloudServiceRemoteDesktopExtensionObject -Name 'RDPExtension' -Credential $credential -Expiration $expiration -TypeHandlerVersion '1.2.1'

$genevaExtension = New-AzCloudServiceExtensionObject -Name GenevaExtension -Publisher Microsoft.Azure.Geneva -Type GenevaMonitoringPaaS -TypeHandlerVersion "2.14.0.2"

$extensionProfile = @{extension = @($rdpExtension, $genevaExtension)}

$tag=@{"Owner" = "Contoso"}

$cscfgFile = "<Path to cscfg configuration file>"

$cscfgContent = Get-Content $cscfgFile | Out-String

$cloudService = New-AzCloudService                                              `
                          -Name ContosoCS                                               `
                          -ResourceGroupName ContosOrg                                  `
                          -Location EastUS                                              `
                          -PackageUrl "https://xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"    `
                          -Configuration $cscfgContent                                  `
                          -UpgradeMode 'Auto'                                           `
                          -RoleProfile $roleProfile                                     `
                          -NetworkProfile $networkProfile                               `
                          -ExtensionProfile $extensionProfile                           `
                          -Tag $tag


$role = New-AzCloudServiceRoleProfilePropertiesObject-Name 'ContosoFrontend' -SkuName 'Standard_D1_v2' -SkuTier 'Standard' -SkuCapacity 2

$roleProfile = @{role = @($role)}

$publicIp = Get-AzPublicIpAddress -ResourceGroupName ContosOrg -Name ContosIp

$feIpConfig = New-AzCloudServiceLoadBalancerFrontendIPConfigurationObject -Name 'ContosoFe' -PublicIPAddressId $publicIp.Id

$loadBalancerConfig = New-AzCloudServiceLoadBalancerConfigurationObject -Name 'ContosoLB' -FrontendIPConfiguration $feIpConfig

$networkProfile = @{loadBalancerConfiguration = $loadBalancerConfig}

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
                          -NetworkProfile $networkProfile

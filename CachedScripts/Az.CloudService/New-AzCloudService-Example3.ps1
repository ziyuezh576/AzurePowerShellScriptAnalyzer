
$role = New-AzCloudServiceRoleProfilePropertiesObject-Name 'ContosoFrontend' -SkuName 'Standard_D1_v2' -SkuTier 'Standard' -SkuCapacity 2

$roleProfile = @{role = @($role)}

$keyVault = Get-AzKeyVault -ResourceGroupName ContosOrg -VaultName ContosKeyVault

$certificate=Get-AzKeyVaultCertificate -VaultName ContosKeyVault -Name ContosCert

$secretGroup = New-AzCloudServiceVaultSecretGroupObject -Id $keyVault.ResourceId -CertificateUrl $certificate.SecretId

$osProfile = @{secret = @($secretGroup)}

$publicIp = Get-AzPublicIpAddress -ResourceGroupName ContosOrg -Name ContosIp

$feIpConfig = New-AzCloudServiceLoadBalancerFrontendIPConfigurationObject -Name 'ContosoFe' -PublicIPAddressId $publicIp.Id

$loadBalancerConfig = New-AzCloudServiceLoadBalancerConfigurationObject -Name 'ContosoLB' -FrontendIPConfiguration $feIpConfig

$networkProfile = @{loadBalancerConfiguration = $loadBalancerConfig}

$cscfgFile = "<Path to cscfg configuration file>"

$cloudService = New-AzCloudService                                              `
                          -Name ContosoCS                                               `
                          -ResourceGroupName ContosOrg                                  `
                          -Location EastUS                                              `
                          -PackageUrl "https://xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"    `
                          -Configuration $cscfgContent                                  `
                          -UpgradeMode 'Auto'                                           `
                          -RoleProfile $roleProfile                                     `
                          -NetworkProfile $networkProfile                               `
                          -OSProfile $osProfile

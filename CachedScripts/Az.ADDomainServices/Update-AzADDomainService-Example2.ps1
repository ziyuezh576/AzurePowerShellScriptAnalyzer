
$getAzAddomain = Get-AzADDomainService -Name youriADdomain -ResourceGroupName youriADdomain

$ADDomainSetting = New-AzADDomainServiceDomainSecuritySettingObject -TlsV1 Disabled

Update-AzADDomainService -InputObject $getAzAddomain -DomainSecuritySetting $ADDomainSetting

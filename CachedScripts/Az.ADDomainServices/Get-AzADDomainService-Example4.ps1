
$getAzAddomain = Get-AzADDomainService -Name youriADdomain -ResourceGroupName youriADdomain

Get-AzADDomainService -InputObject $getAzAddomain

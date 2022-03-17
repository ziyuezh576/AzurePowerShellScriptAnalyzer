
$result=Get-AzEventGridDomain -ResourceGroup MyResourceGroupName

Write-Output $result.PsDomainsList

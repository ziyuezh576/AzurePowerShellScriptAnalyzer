
$getHealth = Get-AzHealthBot -ResourceGroupName youriTest -Name yourihealthbot

Update-AzHealthBot -InputObject $getHealth -Sku F0

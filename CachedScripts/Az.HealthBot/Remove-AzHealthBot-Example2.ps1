
$gethealthbot = Get-AzHealthBot -Name yourihealthbot1 -ResourceGroupName youriTest

Remove-AzHealthBot -InputObject $gethealthbot

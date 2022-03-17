
$getAzbot = Get-AzBotService -Name 'youri-apptest' -ResourceGroupName 'youriBotTest'

Update-AzBotService -InputObject $getAzbot -kind sdk

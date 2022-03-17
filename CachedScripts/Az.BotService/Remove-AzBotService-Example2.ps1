
$getservice = Get-AzBotService -Name youriechobottest -ResourceGroupName youriBotTest

Remove-AzBotService -InputObject $getservice

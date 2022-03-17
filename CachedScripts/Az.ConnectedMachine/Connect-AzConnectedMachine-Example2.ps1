
$session = Connect-PSSession -ComputerName WINBOX

Connect-AzConnectedMachine -ResourceGroupName contoso-rg -Name win_eastus1_1 -Location eastus -PSSession $session

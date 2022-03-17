
$ase = New-AzConnectedNetworkAzureStackEdgeObject -AzureStackEdgeId "/subscriptions/xxxxx-00000-xxxxx-00000/resourcegroups/myResources/providers/Microsoft.DataBoxEdge/dataBoxEdgeDevices/myAse1"

New-AzConnectedNetworkDevice -Name "myMecDevice1" -ResourceGroupName "myResources" -Location "eastus2euap" -Property $ase -SubscriptionId xxxxx-00000-xxxxx-00000


$ase = New-AzConnectedNetworkAzureStackEdgeObject -AzureStackEdgeId "/subscriptions/xxxxx-00000-xxxxx-00000/resourcegroups/myResources/providers/Microsoft.DataBoxEdge/dataBoxEdgeDevices/myAse"

New-AzConnectedNetworkDevice -Name "myMecDevice" -ResourceGroupName "myResources" -Location "eastus" -Property $ase

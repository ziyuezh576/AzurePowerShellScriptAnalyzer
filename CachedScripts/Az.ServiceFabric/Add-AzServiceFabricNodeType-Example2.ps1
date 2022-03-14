
$pwd = ConvertTo-SecureString -String 'Password$123456' -AsPlainText -Force

$resourceGroup = "Group2"

$clusterName = "Contoso01SFCluster"

$nodeTypeName = "n3"

Add-AzServiceFabricNodeType -ResourceGroupName $resourceGroup -Name $clusterName -NodeType $nodeTypeName -Capacity 5 -VmUserName 'adminName' -VmPassword $pwd -DurabilityLevel Silver -Verbose -VMImageSku 18.04-LTS -IsPrimaryNodeType $true

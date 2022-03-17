
$vnetId="/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/testrg/providers/Microsoft.Network/virtualNetworks/testvnet"

$subnetName="default"

$ipConfigName="ipconfig"

$privateIPAllocationMethod="dynamic"

$subnetId=$vnetId+"/subnets/"+$subnetName

$ipConfiguration= New-AzHDInsightIPConfiguration -Name $ipConfigName PrivateIPAllocationMethod $privateIPAllocationMethod -SubnetId $subnetId -Primary

$privateLinkConfigurationName="plconfig"

$groupId="headnode"

$privateLinkConfiguration= New-AzHDInsightPrivateLinkConfiguration -Name $privateLinkConfigurationName -GroupId $groupId -IPConfiguration $ipConfiguration

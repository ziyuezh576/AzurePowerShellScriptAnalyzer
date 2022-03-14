
$pwd = ConvertTo-SecureString -String 'Password$123456' -AsPlainText -Force

Add-AzServiceFabricNodeType -ResourceGroupName 'Group1' -Name 'Contoso01SFCluster' -NodeType 'n2' -Capacity 5 -VmUserName 'adminName' -VmPassword $pwd

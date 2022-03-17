
New-AzRedisCache -ResourceGroupName "MyGroup" -Name "MyCache" -Location "Central US" -Size P1 -Sku "Premium" -SubnetId "/subscriptions/a559b6fd-3a84-40bb-a450-b0db5ed37dfe/resourceGroups/mygroup/providers/Microsoft.Network/virtualNetworks/MyNet/subnets/MySubnet"

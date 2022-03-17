
New-AzVmssConfig -Location <String> -SkuCapacity 2 -SkuName 'Standard_A0' -UpgradePolicyMode Automatic -IdentityType SystemAssigned;


New-AzVmssConfig -Location <String> -Overprovision $false -SkuCapacity 2 -SkuName 'Standard_A0' -Tag @{key0="value0";key1=$null;key2="value2"} -UpgradePolicyMode Automatic;

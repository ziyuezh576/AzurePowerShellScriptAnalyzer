
$Settings = @{"fileUris" = "[]"; "commandToExecute" = ""};

$ProtectedSettings = @{"storageAccountName" = $stoname; "storageAccountKey" = $stokey};

Add-AzVmssExtension -VirtualMachineScaleSet $vmss -Name $vmssExtensionName -Publisher $vmssPublisher  `
  -Type $vmssExtensionType -TypeHandlerVersion $ExtVer -AutoUpgradeMinorVersion $True  `
  -Setting $Settings -ProtectedSetting $ProtectedSettings

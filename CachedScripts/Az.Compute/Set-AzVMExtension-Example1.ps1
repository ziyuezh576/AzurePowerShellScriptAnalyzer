
$Settings = @{"fileUris" = "[]"; "commandToExecute" = ""};

$ProtectedSettings = @{"storageAccountName" = $stoname; "storageAccountKey" = $stokey};

Set-AzVMExtension -ResourceGroupName "ResourceGroup11" -Location "West US" -VMName "VirtualMachine22" -Name "ContosoTest" -Publisher "Contoso.Compute" -ExtensionType "CustomScriptExtension" -TypeHandlerVersion "1.1" -Settings $Settings -ProtectedSettings $ProtectedSettings;

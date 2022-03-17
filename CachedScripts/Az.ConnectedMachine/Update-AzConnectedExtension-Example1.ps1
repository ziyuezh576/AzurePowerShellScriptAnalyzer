
$target = @{"Microsoft.Compute.CustomScriptExtension" = @{"targetVersion"="1.10.12"}}

Update-AzConnectedExtension -ResourceGroupName $env.ResourceGroupName -MachineName $machineName -ExtensionTarget $target

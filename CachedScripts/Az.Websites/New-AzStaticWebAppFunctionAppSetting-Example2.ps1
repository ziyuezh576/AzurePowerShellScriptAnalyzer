
Get-AzStaticWebAppFunctionAppSetting -ResourceGroupName resourceGroup -Name staticweb01 | New-AzStaticWebAppFunctionAppSetting -AppSetting @{'function01' = 'value01'; 'function02' = 'value02' }

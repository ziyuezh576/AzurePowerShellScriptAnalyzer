
Get-AzStaticWebAppSetting -ResourceGroupName resourceGroup -Name staticweb01 | New-AzStaticWebAppSetting -AppSetting @{'function01' = 'value01'; 'function02' = 'value02' }

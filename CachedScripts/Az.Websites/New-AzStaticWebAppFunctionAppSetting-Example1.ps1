
New-AzStaticWebAppFunctionAppSetting -ResourceGroupName azure-rg-test -Name staticweb-pwsh01  -AppSetting @{'function01' = 'value01'; 'function02' = 'value02' }

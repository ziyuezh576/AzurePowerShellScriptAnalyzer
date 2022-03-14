
New-AzStaticWebAppBuildFunctionAppSetting -ResourceGroupName azure-rg-test -Name staticweb-pwsh01 -EnvironmentName 'default' -AppSetting @{'functionapp01' = 'value01'; 'functionapp02' = 'value02' }

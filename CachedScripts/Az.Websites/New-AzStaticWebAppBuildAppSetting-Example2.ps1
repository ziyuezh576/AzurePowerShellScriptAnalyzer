
Get-AzStaticWebAppBuildAppSetting -ResourceGroupName resourceGroup -Name taticweb00 -EnvironmentName 'default' | New-AzStaticWebAppBuildAppSetting -AppSetting @{'buildsetting1' = 'someval'; 'buildsetting2' = 'someval2' }

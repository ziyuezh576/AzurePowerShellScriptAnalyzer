
Get-AzMapsAccount -ResourceGroupName azure-rg-test -Name pwsh-mapsAccount03 | Update-AzMapsAccount -Tag @{'key1'='value1'; 'key2'='value2'}

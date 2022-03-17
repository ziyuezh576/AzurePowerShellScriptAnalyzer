
Get-AzBareMetal -Name oraclerac53 -ResourceGroupName SAT09A-T530 | Update-AzBareMetal -Tag @{"env"="test"}

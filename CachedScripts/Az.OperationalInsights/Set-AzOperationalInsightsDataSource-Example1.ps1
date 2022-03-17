
$datasource = Get-AzOperationalInsightsDataSource -Kind CustomLog -ResourceGroupName testrg -WorkspaceName LogAnalyticsWorkspace

Set-AzOperationalInsightsDataSource -DataSource $datasource

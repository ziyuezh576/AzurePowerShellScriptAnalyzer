
$Workspace = New-AzOperationalInsightsWorkspace -ResourceGroupName nancyc-hn1 -Name sapmonitor-test  -Location westus2 -Sku "Standard"

$WorkspaceKey = Get-AzOperationalInsightsWorkspaceSharedKey -ResourceGroupName nancyc-hn1 -Name sapmonitor-test

New-AzSapMonitor -Name ps-sapmonitor-t01 -ResourceGroupName nancyc-hn1 -Location westus2 -EnableCustomerAnalytic -MonitorSubnet "/subscriptions/9e223dbe-3399-4e19-88eb-0975f02ac87f/resourceGroups/nancyc-hn1/providers/Microsoft.Network/virtualNetworks/vnet-sap/subnets/subnet-admin" -LogAnalyticsWorkspaceSharedKey $WorkspaceKey.PrimarySharedKey -LogAnalyticsWorkspaceId $Workspace.CustomerId -LogAnalyticsWorkspaceResourceId $Workspace.ResourceId

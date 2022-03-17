
Get-AzApiManagementNetworkStatus -ResourceGroupName powershelltest -Name powershellsdkservice

$networkStatus = Get-AzApiManagementNetworkStatus -ResourceGroupName powershelltest -Name powershellsdkservice

$networkStatus.ConnectivityStatus

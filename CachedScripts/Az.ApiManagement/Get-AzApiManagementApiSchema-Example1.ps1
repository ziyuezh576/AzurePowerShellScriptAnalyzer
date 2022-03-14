
$context = New-AzApiManagementContext -ResourceId /subscriptions/subid/resourceGroups/resourceGroupName/providers/Microsoft.ApiManagement/service/sdktestapim4163

Get-AzApiManagementApiSchema -Context $context -ApiId wsdlapitest

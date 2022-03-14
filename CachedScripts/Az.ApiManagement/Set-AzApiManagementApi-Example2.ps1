
$ApiMgmtContext = New-AzApiManagementContext -ResourceGroupName "Api-Default-WestUS" -ServiceName "contoso"

$versionSet = New-AzApiManagementApiVersionSet -Context $context -Name "Echo API Version Set" -Scheme Segment -Description "version set sample"

$api = Get-AzApiManagementApi -Context $ApiMgmtContext -ApiId "echo-api"

$api.ApiVersionSetId = $versionSet.Id

$api.ApiVersion = "v1"

$api.ApiVersionSetDescription = $versionSet.Description

Set-AzApiManagementApi -InputObject $api -PassThru

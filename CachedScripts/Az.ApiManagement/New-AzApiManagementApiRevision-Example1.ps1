
$ApiMgmtContext = New-AzApiManagementContext -ResourceGroupName "Api-Default-WestUS" -ServiceName "contoso"

New-AzApiManagementApiRevision -Context $context -ApiId "echo-api" -ApiRevision "5"

New-AzApiManagementApiRevision -Context $context -ApiId "echo-api" -ApiRevision "5"

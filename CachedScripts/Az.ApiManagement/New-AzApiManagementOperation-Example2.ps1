
$apimContext = New-AzApiManagementContext -ResourceGroupName "Api-Default-WestUS" -ServiceName "contoso"

$RID = New-Object -TypeName Microsoft.Azure.Commands.ApiManagement.ServiceManagement.Models.PsApiManagementParameter

$RID.Name = "RID"

$RID.Description = "Resource identifier"

$RID.Type = "string"

$Query = New-Object -TypeName Microsoft.Azure.Commands.ApiManagement.ServiceManagement.Models.PsApiManagementParameter

$Query.Name = "query"

$Query.Description = "Query string"

$Query.Type = 'string'

$Request = New-Object -TypeName Microsoft.Azure.Commands.ApiManagement.ServiceManagement.Models.PsApiManagementRequest

$Request.Description = "Create/update resource request"

$DummyQp = New-Object -TypeName Microsoft.Azure.Commands.ApiManagement.ServiceManagement.Models.PsApiManagementParameter

$DummyQp.Name = 'dummy'

$DummyQp.Type = 'string'

$DummyQp.Required = $FALSE

$Request.QueryParameters = @($DummyQp)

$Header = New-Object -TypeName Microsoft.Azure.Commands.ApiManagement.ServiceManagement.Models.PsApiManagementParameter

$Header.Name = 'x-custom-header'

$Header.Type = 'string'

$Request.Headers = @($Header)

$RequestRepresentation = New-Object -TypeName Microsoft.Azure.Commands.ApiManagement.ServiceManagement.Models.PsApiManagementRepresentation

$RequestRepresentation.ContentType = 'application/json'

$RequestRepresentation.Sample = '{ "propName": "propValue" }'

$Request.Representations = @($requestRepresentation)

$Response = New-Object -TypeName Microsoft.Azure.Commands.ApiManagement.ServiceManagement.Models.PsApiManagementResponse

$Response.StatusCode = 204

New-AzApiManagementOperation -Context $apimContext -ApiId $APIId -OperationId "01234567890" -Name 'Create/update resource' -Method 'PUT' -UrlTemplate '/resource/{rid}?q={query}' -Description "Use this operation to create new or update existing resource" -TemplateParameters @($rid, $query) -Request $Request -Responses @($response)

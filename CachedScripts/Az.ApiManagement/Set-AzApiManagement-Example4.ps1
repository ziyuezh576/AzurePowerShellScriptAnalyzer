
$apim = Get-AzApiManagement -ResourceGroupName "api-Default-West-US" -Name "Contoso"

$apim.PublisherEmail = "foobar@contoso.com"

$apim.NotificationSenderEmail = "notification@contoso.com"

$apim.OrganizationName = "Contoso"

Set-AzApiManagement -InputObject $apim -PassThru

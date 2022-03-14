
$Thumbprint = "0SZTNJ34TCCMUJ5MJZGR8XQD3S0RVHJBA33Z8ZXV"

$TenantId = "4cd76576-b611-43d0-8f2b-adcb139531bf"

$ApplicationId = "3794a65a-e4e4-493d-ac1d-f04308d712dd"

$SubscriptionId = "81b59010-dc55-45b7-89cd-5ca26db62472"

$RunAsAccountConnectionFieldValues = @{"ApplicationId" = $ApplicationId; "TenantId" = $TenantId; "CertificateThumbprint" = $Thumbprint; "SubscriptionId" = $SubscriptionId}

New-AzAutomationConnection -Name "Connection13" -ConnectionTypeName AzureServicePrincipal -ConnectionFieldValues $RunAsAccountConnectionFieldValues -ResourceGroupName "ResourceGroup01" -AutomationAccountName "AutomationAccount01"

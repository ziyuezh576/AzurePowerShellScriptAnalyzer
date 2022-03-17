
$SubscriptionName = "MyTestSubscription"

$SubscriptionId = "81b59010-dc55-45b7-89cd-5ca26db62472"

$ClassicRunAsAccountCertifcateAssetName = "AzureClassicRunAsCertificate"

$ClassicRunAsAccountConnectionFieldValues = @{"SubscriptionName" = $SubscriptionName; "SubscriptionId" = $SubscriptionId; "CertificateAssetName" = $ClassicRunAsAccountCertifcateAssetName}

New-AzAutomationConnection -Name "Connection14" -ConnectionTypeName AzureClassicCertificate  -ConnectionFieldValues $ClassicRunAsAccountConnectionFieldValues -ResourceGroupName "ResourceGroup01" -AutomationAccountName "AutomationAccount01"

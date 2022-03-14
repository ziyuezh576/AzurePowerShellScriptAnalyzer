
$Password = ConvertTo-SecureString -String "Password" -AsPlainText -Force

New-AzAutomationCertificate -AutomationAccountName "Contoso17" -Name "ContosoCertificate" -Path "./cert.pfx" -Password $Password -ResourceGroupName "ResourceGroup01"

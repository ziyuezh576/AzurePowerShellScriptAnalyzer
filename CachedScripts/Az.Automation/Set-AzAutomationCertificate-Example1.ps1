
$Password = ConvertTo-SecureString -String "Password" -AsPlainText -Force

Set-AzAutomationCertificate -AutomationAccountName "Contos17" -Name "ContosoCertificate" -Path "./cert.pfx" -Password $Password -ResourceGroupName "ResourceGroup01"

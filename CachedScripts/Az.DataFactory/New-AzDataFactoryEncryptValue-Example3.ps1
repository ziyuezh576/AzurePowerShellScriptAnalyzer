
$Value = ConvertTo-SecureString '\\servername' -AsPlainText -Force

$Credential = Get-Credential

New-AzDataFactoryEncryptValue -DataFactoryName "WikiADF" -GatewayName "WikiGateway" -ResourceGroupName "ADF" -Value $Value -Credential $Credential -Type OnPremisesFileSystemLinkedService

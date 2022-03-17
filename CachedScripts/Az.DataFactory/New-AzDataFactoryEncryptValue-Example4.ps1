
$UserName = ConvertTo-SecureString "domain\\username" -AsPlainText -Force

$Password = ConvertTo-SecureString "password" -AsPlainText -Force

$Credential = New-Object System.Management.Automation.PSCredential ($UserName, $Password)

New-AzDataFactoryEncryptValue -DataFactoryName "MyDataFactory" -ResourceGroupName "MyResourceGroup" -GatewayName "MyDataManagementGateway" -Type HdfsLinkedService -AuthenticationType Windows -Credential $Credential -NonCredentialValue "http://server01.com:50070/webhdfs/v1/user/username"

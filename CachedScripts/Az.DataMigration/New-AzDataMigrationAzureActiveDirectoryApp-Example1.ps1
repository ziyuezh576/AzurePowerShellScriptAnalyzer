
$secpasswd = ConvertTo-SecureString "Your Secret Key Here" -AsPlainText -Force

New-AzDmsAadApp -ApplicationId "Your AppId/Service Principal ID here" -AppKey $secpasswd

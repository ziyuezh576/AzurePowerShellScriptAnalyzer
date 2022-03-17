
$userList = Get-AzStaticWebAppUser -ResourceGroupName resourceGroup -Name staticweb01 -Authprovider all    

Remove-AzStaticWebAppUser -InputObject $userList

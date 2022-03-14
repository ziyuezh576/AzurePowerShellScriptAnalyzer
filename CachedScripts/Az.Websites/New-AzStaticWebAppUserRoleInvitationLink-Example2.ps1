
$web = Get-AzStaticWebApp -ResourceGroupName resourceGroup -Name staticweb00

New-AzStaticWebAppUserRoleInvitationLink -InputObject $web -Domain 'Hostname' -Provider 'github' -UserDetail 'UserName' -Role 'admin,contributor' -NumHoursToExpiration 1

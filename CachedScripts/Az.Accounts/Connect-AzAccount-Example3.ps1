
$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $ApplicationId, $SecuredPassword

Connect-AzAccount -ServicePrincipal -TenantId $TenantId -Credential $Credential


Get-AzADServicePrincipal -ObjectId $id | Update-AzADServicePrincipal -Note $note

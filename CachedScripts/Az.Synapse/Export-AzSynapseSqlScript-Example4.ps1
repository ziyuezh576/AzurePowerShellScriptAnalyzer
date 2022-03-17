
$sqlscript = Get-AzSynapseSqlScript  -WorkspaceName ContosoWorkspace -Name ContosoSqlScript

$sqlscript | Export-AzSynapseSqlScript -OutputFolder "C:\sqlscript"

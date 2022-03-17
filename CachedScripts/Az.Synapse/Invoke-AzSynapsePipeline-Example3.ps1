
$pipeline = Get-AzSynapsePipeline -WorkspaceName ContosoWorkspace -Name ContosoPipeline

$pipeline | Invoke-AzSynapsePipeline

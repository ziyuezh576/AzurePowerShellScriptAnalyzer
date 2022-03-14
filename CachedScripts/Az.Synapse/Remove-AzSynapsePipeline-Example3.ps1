
$pipeline = Get-AzSynapsePipeline -WorkspaceName ContosoWorkspace -Name ContosoPipeline

$pipeline | Remove-AzSynapsePipeline

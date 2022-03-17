
$result = Invoke-AzSynapseDataFlowDebugSessionCommand -WorkspaceName ContosoWorkspace -Command executePreviewQuery -SessionId 3afb278e-ac5f-469f-a0b6-2f04c3ab59bc -StreamName source1 -RowLimit 100 -AsJob

$result | ft -wrap

$output = ConvertFrom-Json($result.Output.Data)

$output.output

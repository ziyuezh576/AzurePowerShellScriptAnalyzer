
$ws = Get-AzSynapseWorkspace -Name ContosoWorkspace

$ws | Invoke-AzSynapseDataFlowDebugSessionCommand -Command executePreviewQuery -SessionId 3afb278e-ac5f-469f-a0b6-2f04c3ab59bc -StreamName source1 -RowLimit 100

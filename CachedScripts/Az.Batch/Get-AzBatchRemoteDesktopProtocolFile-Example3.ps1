
$Stream = New-Object -TypeName "System.IO.MemoryStream"

Get-AzBatchRemoteDesktopProtocolFile "Pool06" -ComputeNodeId "ComputeNode03" -DestinationStream $Stream -BatchContext $Context

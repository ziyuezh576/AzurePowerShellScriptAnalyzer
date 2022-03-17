
Invoke-Command -ScriptBlock {Remove-AzStackHCIVMAttestation -VMName "guest1", "guest2"} -ComputerName "node1"

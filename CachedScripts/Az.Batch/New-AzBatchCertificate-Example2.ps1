
$RawData = [System.IO.File]::ReadAllBytes("E:\Certificates\MyCert.pfx")

New-AzBatchCertificate -RawData $RawData -Password "Password1234" -BatchContext $Context

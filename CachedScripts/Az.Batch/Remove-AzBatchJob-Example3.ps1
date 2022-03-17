
$accountname = "PUT YOUR AZURE BATCH ACCOUNT NAME HERE"

$batchcontext = Get-AzBatchAccount -AccountName $accountname

$jobs = Get-AzBatchJob -BatchContext $batchcontext

	Write-Host "Processing "$element.Id

	Remove-AzBatchJob -Id $element.Id -BatchContext $batchcontext -Force -Confirm:$false

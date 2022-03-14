
Add-AzVmssRunCommand -ResourceGroupName $rgname -VMScaleSetName $vmssname -Location eastus -Name myruncommand -Script "Write-Host Hello World" -TimeOutInSeconds 3600 -RunAsUser "admin01" 

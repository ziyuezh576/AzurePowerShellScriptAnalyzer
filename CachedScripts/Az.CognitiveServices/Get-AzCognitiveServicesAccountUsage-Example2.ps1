
$acc = Get-AzCognitiveServicesAccount -ResourceGroupName TestUsages -Name TestCVUsages_Prediction

Get-AzCognitiveServicesAccountUsage -InputObject $acc

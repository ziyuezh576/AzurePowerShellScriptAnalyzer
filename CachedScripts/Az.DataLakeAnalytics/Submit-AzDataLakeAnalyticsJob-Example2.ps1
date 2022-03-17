
$parameters = [ordered]@{}

$parameters["Department"] = "Sales"

$parameters["NumRecords"] = 1000

$parameters["StartDateTime"] = (Get-Date).AddDays(-14)

Submit-AzDataLakeAnalyticsJob -Account "ContosoAdlAccount" -Name "New Job" -ScriptPath $LocalScriptPath -AnalyticsUnits 32 -ScriptParameter $parameters

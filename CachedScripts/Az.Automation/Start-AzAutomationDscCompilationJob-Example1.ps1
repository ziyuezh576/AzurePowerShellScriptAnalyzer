
$Params = @{"StringParam"="Hello World";"IntegerParam"=32}

Start-AzAutomationDscCompilationJob -ConfigurationName "Config01" -Parameters $Params -ResourceGroupName "ResourceGroup01"

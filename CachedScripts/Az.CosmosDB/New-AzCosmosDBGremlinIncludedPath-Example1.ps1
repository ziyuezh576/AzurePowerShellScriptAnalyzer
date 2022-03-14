
$index1 = New-AzCosmosDBGremlinIncludedPathIndex -DataType String -Precision -1 -Kind Hash

New-AzCosmosDBGremlinIncludedPath -Path "/*" -Index $index1

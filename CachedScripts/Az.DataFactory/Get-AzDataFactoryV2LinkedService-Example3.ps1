
$DataFactory = Get-AzDataFactoryV2 -ResourceGroupName "ADF" -Name "ContosoFactory"

Get-AzDataFactoryV2LinkedService -DataFactory $DataFactory | Format-Table -Property Name, DataFactoryName, ResourceGroupName

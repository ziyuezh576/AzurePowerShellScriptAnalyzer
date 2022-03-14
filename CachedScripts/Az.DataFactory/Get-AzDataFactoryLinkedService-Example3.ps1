
$DataFactory = Get-AzDataFactory -ResourceGroupName "ADF" -Name "ContosoFactory"

Get-AzDataFactoryLinkedService -DataFactory $DataFactory | Format-Table -Property LinkedServiceName, DataFactoryName, ResourceGroupName

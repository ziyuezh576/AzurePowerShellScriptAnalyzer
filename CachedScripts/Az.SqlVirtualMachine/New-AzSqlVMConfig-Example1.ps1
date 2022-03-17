
$config = New-AzSqlVMConfig -LicenseType "PAYG"

New-AzSqlVM -ResourceGroupName "ResourceGroup01" -Name "vm" -SqlVM $config

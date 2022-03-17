
New-AzApiManagement -ResourceGroupName "contoso-rg" -Name "apim-test-pshell-azs" -Location "Central US" -Organization "Contoso" -AdminEmail "admin@contoso.com" -Sku Premium -Capacity 3 -Zone @("1","2","3")


New-AzTag -Name "CostCenter" -Value "0001"

Set-AzResourceGroup -Name "EngineerBlog" -Tag @{Name="CostCenter";Value="0001"}

Get-AzTag -Name "CostCenter"

Get-AzResourceGroup -Tag @{Name="CostCenter"}


$Application = Get-AzManagedApplication -Name "myApp" -ResourceGroupName "myRG"

Remove-AzManagedApplication -Id $Application.ResourceId -Force

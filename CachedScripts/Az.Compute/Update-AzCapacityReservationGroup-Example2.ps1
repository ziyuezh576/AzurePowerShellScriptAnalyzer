
Get-AzCapacityReservationGroup -ResourceGroupName $rgname -Name $capResGroup | Update-AzCapacityReservationGroup -Tag @{ CreatedBy = "John" }

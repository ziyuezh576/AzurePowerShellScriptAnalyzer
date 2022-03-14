
Get-AzCapacityReservation -ResourceGroupName $rgname -ReservationGroupName $capResGroup -Name $capRes | Update-AzCapacityReservation -CapacityToReserve 4

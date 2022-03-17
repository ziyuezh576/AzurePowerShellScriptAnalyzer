
$mariaDb = Get-AzMariaDbServer -Name mariadb-test-9pebvn -ResourceGroupName mariadb-test-qu5ov0 

New-AzMariaDbReplica -Master $mariaDb -ReplicaName mariadb-test-9pebvn-rep03

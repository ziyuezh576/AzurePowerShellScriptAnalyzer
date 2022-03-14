
$tableMap = New-Object 'system.collections.hashtable'

	$tableMap.Add("dbo.TestTable1", "dbo.TestTable1")

	$tableMap.Add("dbo.TestTable2","dbo.TestTable2")

	$selectedDbs = New-AzDmsSyncSelectedDBObject 


      $Column1 = New-AzCosmosDBCassandraColumn -Name "ColumnA" -Type "int"

      $Column2 = New-AzCosmosDBCassandraColumn -Name "ColumnB" -Type "ascii"

      $Column3 = New-AzCosmosDBCassandraColumn -Name "ColumnC" -Type "int"

      $Column4 = New-AzCosmosDBCassandraColumn -Name "ColumnD" -Type "ascii"

      $clusterkey1 = New-AzCosmosDBCassandraClusterKey -Name "ColumnB" -OrderBy "Asc"

      $clusterkey2 = New-AzCosmosDBCassandraClusterKey -Name "ColumnA" -OrderBy "Asc"

      $schema = New-AzCosmosDBCassandraSchema -Column $Column1,$Column2 -ClusterKey $clusterkey1 -PartitionKey "ColumnA"

      New-AzCosmosDBCassandraTable -AccountName myAccountName -ResourceGroupName myRgName -KeyspaceName myKeyspaceName -Name myTableName -Schema $schema

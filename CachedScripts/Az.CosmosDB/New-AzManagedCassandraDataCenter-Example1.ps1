
New-AzManagedCassandraDataCenter `
 -ResourceGroupName {resourceGroupName} `
 -ClusterName {clusterName} `
 -DataCenterName {dataCenterName} `
 -DelegatedSubnetId {resourceId} `
 -Location {location} `
 -NodeCount {N}


New-AzManagedCassandraCluster `
 -ResourceGroupName {resourceGroupName} `
 -ClusterName {clusterName} `
 -DelegatedManagementSubnetId {resourceId} `
 -Location {location} `
 -InitialCassandraAdminPassword {password}

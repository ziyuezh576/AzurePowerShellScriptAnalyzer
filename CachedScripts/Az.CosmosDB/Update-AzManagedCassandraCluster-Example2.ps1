
Update-AzManagedCassandraCluster `
 -ResourceId {clusterResourceId} `
 -ExternalGossipCertificate {certificates} `
 -ClientCertificate {certificates} `
 -RepairEnabled {boolean}

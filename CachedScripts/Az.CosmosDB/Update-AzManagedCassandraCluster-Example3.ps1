
$clusterResource | Update-AzManagedCassandraCluster `
 -ExternalGossipCertificate {certificates} `
 -ClientCertificate {certificates} `
 -RepairEnabled {boolean}

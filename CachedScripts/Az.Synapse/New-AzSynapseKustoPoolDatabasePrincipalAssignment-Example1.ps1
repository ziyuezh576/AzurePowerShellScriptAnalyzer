
New-AzSynapseKustoPoolDatabasePrincipalAssignment -ResourceGroupName testrg -WorkspaceName testws -KustoPoolName testkustopool -DatabaseName testdatabase -PrincipalAssignmentName kustoprincipal -PrincipalId 00000000-0000-0000-0000-000000000000 -PrincipalType App -Role Viewer

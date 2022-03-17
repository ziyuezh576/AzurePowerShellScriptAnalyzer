
$tokenStartTime = Get-Date 

$tokenEndTime = $tokenStartTime.AddYears(1) 

$storAcc = Get-AzStorageAccount -ResourceGroupName ContosoOrg -Name ContosoStorAcc

$csPkgBlob = Get-AzStorageBlob -Container Contoso-Container -Blob ContosoBlob.cspkg -Context $storAcc.Context

$csPkgToken = New-AzStorageBlobSASToken -Container Contoso-Container -Blob ContosoBlob.cspkg -Permission rwd -StartTime $tokenStartTime -ExpiryTime $tokenEndTime -Context $storAcc.Context

$cspkgUrl = $csPkgBlob.ICloudBlob.Uri.AbsoluteUri + $csPkgToken 

$cloudService = New-AzCloudService                                              `
                          -Name ContosoCS                                               `
                          -ResourceGroupName ContosOrg                                  `
                          -Location EastUS                                              `
                          -ConfigurationFile C:\files\CS.cscfg                          `
                          -DefinitionFile C:\files\CS.csdef                             `
                          -packageUrl $cspkgUrl                                         `


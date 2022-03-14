
New-AzWvdMsixPackage -FullName PackageFullName `
							-HostPoolName HostPoolName `
							-ResourceGroupName ResourceGroupName ` 
							-SubscriptionId SubscriptionId ` 
							-DisplayName displayname `
							-ImagePath imageURI ` 
							-IsActive:$false `
							-IsRegularRegistration:$false `
							-LastUpdated datelastupdated `
							-PackageApplication $apps `
							-PackageDependency $deps `
							-PackageFamilyName packagefamilyname `
							-PackageName packagename `
							-PackageRelativePath packagerelativepath `
							-Version packageversion `


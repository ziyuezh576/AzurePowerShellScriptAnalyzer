
Update-AzWvdMsixPackage -HostPoolName HostPoolName `
				-ResourceGroupName ResourceGroupName `
				-SubscriptionId SubscriptionId `
				-displayName 'Updated-display-Name' `
        			-IsRegularRegistration:$False `
				-IsActive:$True

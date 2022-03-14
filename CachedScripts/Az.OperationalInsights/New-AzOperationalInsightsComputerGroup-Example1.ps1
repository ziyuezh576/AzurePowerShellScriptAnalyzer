
New-AzOperationalInsightsComputerGroup -Category 'ContosoSavedSearchCategory' -DisplayName 'ContosoSavedSearchDisplayName' -Query 'Type=Event' -ResourceGroupName myresourcegroup -SavedSearchId 'ContosoSavedSearchId' -Version 1 -WorkspaceName <String>

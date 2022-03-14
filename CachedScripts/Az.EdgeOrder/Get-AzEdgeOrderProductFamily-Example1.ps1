
$familyDetails = Get-AzEdgeOrderProductFamily -SubscriptionId SubscriptionId -FilterableProperty  @{"azurestackedge"=@($filterableProperty)} -Expand "configurations"

$familyDetails.ProductLine.Product.Configuration.HierarchyInformation

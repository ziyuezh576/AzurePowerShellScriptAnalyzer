
$got = Get-AzPurviewAccount -Name test-pa -ResourceGroupName test-rg

Add-AzPurviewAccountRootCollectionAdmin -InputObject $got -ObjectId xxxxxxxx-5be9-4f43-abd2-04561777c8b0

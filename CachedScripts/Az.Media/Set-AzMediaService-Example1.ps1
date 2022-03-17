
$Tags = @{"tag1" = "value1"; "tag2" = "value2"}

Set-AzMediaService -ResourceGroupName "ResourceGroup123" -AccountName "MediaService001" -Tag $Tags -StorageAccounts $StorageAccounts

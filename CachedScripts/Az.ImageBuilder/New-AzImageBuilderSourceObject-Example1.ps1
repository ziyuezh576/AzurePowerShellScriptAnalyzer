
$imageid = '/subscriptions/9e223dbe-3399-4e19-88eb-0975f02ac87f/resourceGroups/wyunchi-imagebuilder/providers/Microsoft.Compute/images/test-linux-image'

New-AzImageBuilderSourceObject -SourceTypeManagedImage -ImageId $imageid

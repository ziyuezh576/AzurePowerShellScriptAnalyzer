
$policy = Set-AzStorageBlobInventoryPolicy -ResourceGroupName $resourceGroupName  -StorageAccountName $accountName -Policy (@{

                @{
                    Enabled=$false;
                    Name="Test2";
                    Destination=$containerName;
                    Definition=(@{
                        ObjectType="Container";
                        Format="Parquet";
                        Schedule="Daily";
                        SchemaFields=@("name","Metadata","PublicAccess");
                        Filters=(@{
                            PrefixMatch=@("conpre1","conpre2");
                        })
                    })
                })

$policy

$policy.Rules 

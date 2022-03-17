
New-AzRedisCache -ResourceGroupName "MyGroup" -Name "MyCache" -Location "Central US" -Size P1 -Sku "Premium" -RedisConfiguration @{"aof-backup-enabled" = "true"; "aof-storage-connection-string-0" = "DefaultEndpointsProtocol=https;AccountName=mystorageaccount;AccountKey=pJ+jruGKPHDKsEC8kmoybobH3TZx2njBR3ipEsquZFo=;EndpointSuffix=core.windows.net"}

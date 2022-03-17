
Set-AzRedisCache -Name "MyCache" -RedisConfiguration @{"rdb-backup-enabled" = "true"; "rdb-storage-connection-string" = "DefaultEndpointsProtocol=https;AccountName=mystorageaccount;AccountKey=pJ+jruGKPHDKsEC8kmoybobH3TZx2njBR3ipEsquZFo=;EndpointSuffix=core.windows.net"; "rdb-backup-frequency" = "30"}

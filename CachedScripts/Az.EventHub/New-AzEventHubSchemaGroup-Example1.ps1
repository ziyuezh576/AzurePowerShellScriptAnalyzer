
New-AzEventHubSchemaGroup -ResourceGroupName myresourcegroup -Namespace mynamespace -Name myschemagroup -SchemaCompatibility Forward -SchemaType Avro -GroupProperty @{'key1'='value1';'key2'='value2'}


$tags = @{'key'='value'}

$group = Update-AzSqlVMGroup -InputObject $group -Tags $tags

$group.Tags

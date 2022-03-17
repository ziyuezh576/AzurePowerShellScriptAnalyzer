
$ap = @{}

$ap.add("key0","value0")

$sp = @{}

$sp.add("key1", "value1")

Test-AzIotHubRoute -ResourceGroupName "myresourcegroup" -Name "myiothub" -RouteName R1 -AppProperty $ap -SystemProperty $sp

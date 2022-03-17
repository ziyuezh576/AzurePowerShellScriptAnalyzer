
$Tags = @{"Dept"="Finance"; "Status"="Normal"}

New-AzTag -ResourceId /subscriptions/{subId}/resourcegroups/{rg}/providers/Microsoft.Sql/servers/Server1 -Tag $Tags

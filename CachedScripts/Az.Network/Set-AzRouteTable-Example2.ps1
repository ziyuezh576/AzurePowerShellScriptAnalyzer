
$rt = Get-AzRouteTable -ResourceGroupName "rgName" -Name "rtName"

$rt.DisableBgpRoutePropagation

$rt.DisableBgpRoutePropagation = $true

Set-AzRouteTable -RouteTable $rt

$rt = Get-AzRouteTable -ResourceGroupName "rgName" -Name "rtName"

$rt.DisableBgpRoutePropagation

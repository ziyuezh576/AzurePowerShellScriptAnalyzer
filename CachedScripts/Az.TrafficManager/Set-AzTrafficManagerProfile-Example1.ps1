
$TrafficManagerProfile = Get-AzTrafficManagerProfile -Name "ContosoProfile" -ResourceGroupName "ResourceGroup11" 

$TrafficManagerProfile.ProfileStatus = Disabled

Set-AzTrafficManagerProfile -TrafficManagerProfile $TrafficManagerProfile

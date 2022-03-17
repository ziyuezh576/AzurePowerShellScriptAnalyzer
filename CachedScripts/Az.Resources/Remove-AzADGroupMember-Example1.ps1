
$members = @()

$members += (Get-AzADUser -DisplayName $uname).Id

$members += (Get-AzADServicePrincipal -ApplicationId $appid).Id

Get-AzADGroupMember -DisplayName $gname | Remove-AzADGroupMember -MemberObjectId $member


$list = @()

Get-AzSubscriptionDiagnosticSettingCategory | ForEach-Object {

	$list += (New-AzDiagnosticDetailSetting -Log -Category $_.Name -Enabled)

$DiagnosticSettingName = 'please use your setting name here'

$SubscriptionId = 'please use your subscription Id here'

$WorkspaceId = 'please use your workspace Id here'

$setting = New-AzDiagnosticSetting -Name $DiagnosticSettingName -SubscriptionId $SubscriptionId -WorkspaceId $WorkspaceId -Setting $list

Set-AzDiagnosticSetting -InputObject $setting

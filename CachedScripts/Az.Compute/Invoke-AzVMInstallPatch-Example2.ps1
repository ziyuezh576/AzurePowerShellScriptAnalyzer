
$myVM = Get-AzVM -ResourceGroupName 'MyRG' -Name 'MyVM'

Invoke-AzVmInstallPatch -VM $myVM -MaximumDuration "PT90M" -RebootSetting "Always" -Windows -ClassificationToIncludeForWindows "Security" -KBNumberToInclude ["KB1234567", "KB123567"] -KBNumberToExclude ["KB1234702", "KB1234802"] -ExcludeKBsRequiringReboot

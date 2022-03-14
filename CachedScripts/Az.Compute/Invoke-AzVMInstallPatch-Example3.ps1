
$myLinuxVM = Get-AzVM -ResourceGroupName 'MyRG' -Name 'MyLinuxVM'

Invoke-AzVMInstallPatch -ResourceId $myLinuxVM.id -MaximumDuration "PT90M" -RebootSetting "Always" -Linux -ClassificationToIncludeForLinux "Security" -PackageNameMaskToInclude ["package123"] -PackageNameMaskToExclude ["package567"]

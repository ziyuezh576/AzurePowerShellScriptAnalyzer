
Invoke-AzVMRunCommand -ResourceGroupName 'rgname' -Name 'vmname' -CommandId 'RunShellScript' -ScriptPath 'sample.bash' -Parameter @{"param1" = "var1";"param2" = "var2"}

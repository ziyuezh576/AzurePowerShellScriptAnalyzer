
$SshKey1 = Get-AzSshKey -ResourceGroupName "testRG" -Name "sshKey1"

Update-AzSshKey -ResourceGroupName "testRG" -Name "sshKey2" -PublicKey $SshKey1.publickey

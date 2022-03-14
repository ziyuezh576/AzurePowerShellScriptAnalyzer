
$resetJwt = Get-Content -Path .\reset.policy.txt.signed.txt

Reset-AzAttestationPolicy -Name pshtest -ResourceGroupName psh-test-rg -Tee SgxEnclave -Policy $resetJwt

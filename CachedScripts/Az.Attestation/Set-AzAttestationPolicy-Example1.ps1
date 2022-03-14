
$policy = Get-Content -Path .\custom.sgx.policy.txt

Set-AzAttestationPolicy -Name pshtest -ResourceGroupName psh-test-rg -Tee SgxEnclave -Policy $policy

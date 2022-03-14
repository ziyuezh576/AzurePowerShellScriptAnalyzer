
$policyjwt = Get-Content -Path .\custom.sgx.policy.jwt.format.txt

Set-AzAttestationPolicy -Name pshtest -ResourceGroupName psh-test-rg -Tee SgxEnclave -Policy $policyjwt -PolicyFormat JWT

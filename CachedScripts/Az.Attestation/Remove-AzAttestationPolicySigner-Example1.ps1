
$trustedSigner = Get-Content -Path .\trusted.signer.txt

Remove-AzAttestationPolicySigner -Name pshtest -ResourceGroupName psh-test-rg -Signer $trustedSigner

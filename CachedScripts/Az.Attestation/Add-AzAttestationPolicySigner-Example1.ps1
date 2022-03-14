
$trustedSigner = Get-Content -Path .\trusted.signer.txt

Add-AzAttestationPolicySigner -Name pshtest -ResourceGroupName psh-test-rg -Signer $trustedSigner

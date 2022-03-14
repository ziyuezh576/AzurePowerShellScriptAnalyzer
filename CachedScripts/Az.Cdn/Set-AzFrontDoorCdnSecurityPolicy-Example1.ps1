
Set-AzFrontDoorCdnSecurityPolicy -DomainId $domainId -ProfileName $profileName -ResourceGroupName $resourceGroupName -SecurityPolicyName $securityPolicyName -WafPolicyId $wafPolicyId

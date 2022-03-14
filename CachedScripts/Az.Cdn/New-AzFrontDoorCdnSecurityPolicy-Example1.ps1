
New-AzFrontDoorCdnSecurityPolicy -ProfileName $profileName -ResourceGroupName $resourceGroupName -SecurityPolicyName $securityPolicyName -WafPolicyId $wafPolicyId -DomainId $domainId

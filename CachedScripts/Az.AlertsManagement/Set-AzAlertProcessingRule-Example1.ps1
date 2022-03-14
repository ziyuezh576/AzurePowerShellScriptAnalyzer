
Set-AzAlertProcessingRule -ResourceGroupName "test-rg" -Name "AddActionGroupToSubscription" -Scope "/subscriptions/MySubscriptionId" -Description "Add ActionGroup1 to all alerts in the subscription" -Enabled "True" -AlertProcessingRuleType "AddActionGroups" -ActionGroupId "/subscriptions/MySubscriptionId/resourcegroups/MyResourceGroup1/providers/microsoft.insights/actiongroups/ActionGroup1" 

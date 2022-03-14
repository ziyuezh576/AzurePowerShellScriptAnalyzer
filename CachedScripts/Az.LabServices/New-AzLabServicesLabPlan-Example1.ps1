
New-AzLabServicesLabPlan `
	-LabPlanName "testplan" `
	-ResourceGroupName "Group Name" `
	-Location "westus2" `
	-AllowedRegion @('westus2', 'eastus2') `
	-DefaultAutoShutdownProfileShutdownOnDisconnect Disabled `
	-DefaultAutoShutdownProfileShutdownOnIdle None `
	-DefaultAutoShutdownProfileShutdownWhenNotConnected Disabled `
	-DefaultConnectionProfileClientRdpAccess Public `
	-DefaultConnectionProfileClientSshAccess None `
	-SupportInfoEmail 'test@contoso.com' `
	-SupportInfoInstruction 'test information' `
	-SupportInfoPhone '123-456-7890' `
	-SupportInfoUrl 'https:\\test.com' `
	-DefaultConnectionProfileWebRdpAccess None `
	-DefaultConnectionProfileWebSshAccess None

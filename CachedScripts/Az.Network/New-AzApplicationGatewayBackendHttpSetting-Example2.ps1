
New-AzApplicationGatewayBackendHttpSetting -CookieBasedAffinity Enabled -Name 'Setting01' -PickHostNameFromBackendAddress -Port 80 -Probe <PSApplicationGatewayProbe> -Protocol http -RequestTimeout <Int32>

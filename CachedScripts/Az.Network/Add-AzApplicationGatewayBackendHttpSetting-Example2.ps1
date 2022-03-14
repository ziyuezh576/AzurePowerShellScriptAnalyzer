
Add-AzApplicationGatewayBackendHttpSetting -ApplicationGateway <PSApplicationGateway> -CookieBasedAffinity Enabled -Name 'Setting02' -PickHostNameFromBackendAddress -Port 88 -Probe <PSApplicationGatewayProbe> -Protocol http -RequestTimeout <Int32>

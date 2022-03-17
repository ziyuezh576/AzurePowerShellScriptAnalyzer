
Set-AzApplicationGatewayBackendHttpSetting -ApplicationGateway <PSApplicationGateway> -CookieBasedAffinity Enabled -Name 'Setting02' -Port 88 -Probe <PSApplicationGatewayProbe> -Protocol https -RequestTimeout <Int32>

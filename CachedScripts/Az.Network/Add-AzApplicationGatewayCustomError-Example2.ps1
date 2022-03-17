
 $resourceGroupName = "resourceGroupName"

 $AppGWName = "applicationGatewayName"

 $customError502Url = "https://mycustomerrorpages.blob.core.windows.net/errorpages/502.htm"

 $listenerName = "listenerName"

 $AppGw = Get-AzApplicationGateway -Name $AppGWName -ResourceGroupName $resourceGroupName

 $listener = Get-AzApplicationGatewayHttpListener -ApplicationGateway $AppGW -Name $listenerName

 $updatedListener = Add-AzApplicationGatewayHttpListenerCustomError -HttpListener $listener -StatusCode HttpStatus502 -CustomErrorPageUrl $customError502Url 

 Set-AzApplicationGateway -ApplicationGateway $AppGw


Set-AzApplicationGatewaySslPolicy -ApplicationGateway <PSApplicationGateway> -CipherSuite 'TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256' -MinProtocolVersion TLSv1_0 -PolicyType Predefined

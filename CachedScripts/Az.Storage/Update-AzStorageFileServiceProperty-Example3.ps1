
Update-AzStorageFileServiceProperty -ResourceGroupName "myresourcegroup" -AccountName "mystorageaccount" `
			-SMBProtocolVersion SMB2.1,SMB3.0,SMB3.1.1  `
			-SMBAuthenticationMethod Kerberos,NTLMv2 `
			-SMBKerberosTicketEncryption RC4-HMAC,AES-256 `
			-SMBChannelEncryption AES-128-CCM,AES-128-GCM,AES-256-GCM 

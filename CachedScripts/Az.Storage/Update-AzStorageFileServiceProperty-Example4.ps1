
Update-AzStorageFileServiceProperty -ResourceGroupName "myresourcegroup" -AccountName "mystorageaccount" `
			-SMBProtocolVersion @() `
			-SMBAuthenticationMethod @() `
			-SMBKerberosTicketEncryption @() `
			-SMBChannelEncryption @() 

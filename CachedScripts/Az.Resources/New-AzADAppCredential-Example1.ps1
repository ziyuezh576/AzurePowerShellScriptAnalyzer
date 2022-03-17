
$Id = "00000000-0000-0000-0000-000000000000"

$credential = New-Object -TypeName "Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Models.ApiV10.MicrosoftGraphKeyCredential" `
                                 -Property @{'Key' = $cert; `
                                 'Usage'       = 'Verify'; `
                                 'Type'        = 'AsymmetricX509Cert' `
                                 }

New-AzADAppCredential -ObjectId $Id -KeyCredentials $credential

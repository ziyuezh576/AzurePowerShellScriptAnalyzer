
$password = ConvertTo-SecureString "Password123!" -AsPlainText -Force

$creds = New-Object System.Management.Automation.PSCredential ("ContosoUser", $password)

New-AzSynapseWorkspace -ResourceGroupName ContosoResourceGroup -Name ContosoWorkspace -Location northeurope -DefaultDataLakeStorageAccountName ContosoAdlGen2Storage -DefaultDataLakeStorageFilesystem ContosoFileSystem -SqlAdministratorLoginCredential $creds

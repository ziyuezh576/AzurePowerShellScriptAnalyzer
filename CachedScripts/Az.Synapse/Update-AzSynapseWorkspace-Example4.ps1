
$config = New-AzSynapseGitRepositoryConfig -RepositoryType GitHub -AccountName ContosoAccount -RepositoryName ContosoRepo -CollaborationBranch main

Update-AzSynapseWorkspace -Name ContosoWorkspace -GitRepository $config

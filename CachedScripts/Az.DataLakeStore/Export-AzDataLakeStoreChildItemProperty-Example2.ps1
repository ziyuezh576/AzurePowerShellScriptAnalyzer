
$fullAcl="user:contoso-userid:--x|user::rwx|other::---|group::rwx"

$newFullAcl = $fullAcl.Split("{|}");

Set-AzDataLakeStoreItemAcl -Account ContosoADL -Path /a -Acl $newFullAcl -Recurse -Debug

Export-AzDataLakeStoreChildItemProperty -Account ContosoADL -Path /a -OutputPath "C:\Users\contoso\Desktop\DumpFile.txt" -GetAcl -HideConsistentAcl -IncludeFile


$ACL = Get-AzDataLakeStoreItemAclEntry -AccountName "ContosoADL" -Path /

Set-AzDataLakeStoreItemAcl -AccountName "ContosoADL" -Path "/MyFiles/Test.txt" -Acl $ACL

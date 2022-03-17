
$fullAcl="user:enterpriseObjectID:rwx,default:user:enterpriseObjectID:rwx"

$newFullAcl = $fullAcl.Split(",")

Remove-AzDataLakeStoreItemAclEntry -AccountName "ContosoADL" -Path / -Acl $newFullAcl -Recurse -Concurrency 128 -ShowProgress -Verbose


$fullAcl="user:userid1:--x,default:user:userid1:--x"

$newFullAcl = $fullAcl.Split(",")

Set-AzDataLakeStoreItemAclEntry -AccountName "ContosoADL" -Path / -Acl $newFullAcl -Recurse -Concurrency 128 -ShowProgress -Verbose

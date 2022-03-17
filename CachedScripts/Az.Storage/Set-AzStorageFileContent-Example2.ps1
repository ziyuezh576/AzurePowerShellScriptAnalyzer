
$CurrentFolder = (Get-Item .).FullName

$Container = Get-AzStorageShare -Name "ContosoShare06"

Get-ChildItem -Recurse | Where-Object { $_.GetType().Name -eq "FileInfo"} | ForEach-Object {

    $path=$_.FullName.Substring($Currentfolder.Length+1).Replace("\","/")

    Set-AzStorageFileContent -Share $Container -Source $_.FullName -Path $path -Force


$TemplateFileText = [System.IO.File]::ReadAllText("D:\Azure\Templates\OrgSetup.json")

$TemplateObject = ConvertFrom-Json $TemplateFileText -AsHashtable

Test-AzManagementGroupDeployment -ManagementGroupId "myMG" -Location "West US" -TemplateObject $TemplateObject -TemplateParameterFile "D:\Azure\Templates\EngSiteParams.json"

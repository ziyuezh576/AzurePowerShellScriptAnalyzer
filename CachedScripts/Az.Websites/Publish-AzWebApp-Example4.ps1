
$app = Get-AzWebApp -ResourceGroupName ContosoRG -Name ContosoApp

$app | Publish-AzWebApp -ArchivePath C:\project\java_app.jar

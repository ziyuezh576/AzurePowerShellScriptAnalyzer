
$app = Get-AzWebApp -ResourceGroupName ContosoRG -Name ContosoApp

Publish-AzWebApp -WebApp $app -ArchivePath C:\project\app.zip -Force

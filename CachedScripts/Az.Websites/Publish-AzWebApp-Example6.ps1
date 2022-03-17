
$app = Get-AzWebApp -ResourceGroupName ContosoRG -Name ContosoApp

Publish-AzWebApp -WebApp $app -ArchivePath C:\project\app.zip -Timeout 300000 -Force

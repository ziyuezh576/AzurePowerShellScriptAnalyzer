
$bp = Get-AzBlueprint -Name SimpleBlueprint

Export-AzBlueprintWithArtifact -Blueprint $bp -Version 1.0 -OutputPath C:\Blueprints

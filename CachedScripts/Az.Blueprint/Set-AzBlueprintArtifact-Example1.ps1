
$bp = Get-AzBlueprint -Name SimpleBlueprint

Set-AzBlueprintArtifact -Name PolicyStorage -Blueprint $bp -ArtifactFile C:\PolicyAssignmentStorageTag.json

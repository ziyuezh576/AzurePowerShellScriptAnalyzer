
$bp = Get-AzBlueprint -Name SimpleBlueprint

New-AzBlueprintArtifact -Name PolicyStorage -Blueprint $bp -ArtifactFile C:\PolicyAssignmentStorageTag.json

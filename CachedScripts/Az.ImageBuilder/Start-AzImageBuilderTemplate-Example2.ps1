
$template = Get-AzImageBuilderTemplate -ResourceGroupName wyunchi-imagebuilder -Name template-name-sn78hg

Start-AzImageBuilderTemplate -InputObject $template

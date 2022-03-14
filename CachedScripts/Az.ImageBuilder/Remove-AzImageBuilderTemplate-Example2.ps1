
$template = Get-AzImageBuilderTemplate -ImageTemplateName template-name-3uo8p6 -ResourceGroupName wyunchi-imagebuilder

Remove-AzImageBuilderTemplate -InputObject $template

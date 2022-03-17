
$apiProperties = New-AzCognitiveServicesAccountApiProperty

$apiProperties.QnaRuntimeEndpoint = "https://qnamaker.azurewebsites.net"

New-AzCognitiveServicesAccount -ResourceGroupName cognitive-services-resource-group -name qnamaker -Type QnAMaker -SkuName S0 -Locatio WestUS -ApiProperty $apiProperties

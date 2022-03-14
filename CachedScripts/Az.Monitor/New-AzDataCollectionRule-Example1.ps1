
New-AzDataCollectionRule -Location 'East US 2 EUAP' -ResourceGroupName 'testdcr' `
                                -RuleName 'newDcrEx1' -RuleFile 'C:\samples\dcrEx1.json' `
                                -Description 'Dcr description' `
                                -Tag @{"tag1"="value1"; "tag2"="value2"}

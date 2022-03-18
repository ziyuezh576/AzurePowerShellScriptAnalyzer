1. Clone https://github.com/Azure/azure-powershell to "$env:USERPROFILE\source\repos"
2. Clone https://github.com/MicrosoftDocs/azure-docs-powershell to "$env:USERPROFILE\source\repos" (optional)
3. Run: Count-Examples.ps1 "$env:USERPROFILE\source\repos\azure-powershell\src" "$env:USERPROFILE\source\repos\azure-docs-powershell\azps-7.3.0" "$env:USERPROFILE\source\repos\Count-Examples\\*.psm1" -AnalyzeExampleScript -OutputExampleScript
4. It will create:
    - PowerShell codes splitted by example to ".\ScriptsByExample\\$module\\*.ps1"
    - Analyzing results by module to ".\ScriptsByExample\\$module.csv"
    - ".\Status.csv"
    - ".\Missing.csv"
    - ".\DeletingSeparating.csv"

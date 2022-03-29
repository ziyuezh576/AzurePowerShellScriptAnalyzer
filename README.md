1. Clone https://github.com/Azure/azure-powershell to "$env:USERPROFILE\source\repos"
2. Clone https://github.com/MicrosoftDocs/azure-docs-powershell to "$env:USERPROFILE\source\repos" (optional)
3. Run: Measure-MarkdownOrScript.ps1 -MarkdownPaths "$env:USERPROFILE\source\repos\azure-docs-powershell\azps-7.3.0" -RulePaths ".\AnalyzeRules\\*.psm1" -Recurse -AnalyzeScriptsInFile -OutputScriptsInFile -OutputResultsByModule
4. It will create:
    - PowerShell codes splitted by example to ".\ScriptsByExample\\$module\\*.ps1"
    - Analyzing results by module to ".\ScriptsByExample\\$module.csv"
    - ".\Scale.csv"
    - ".\Missing.csv"
    - ".\DeletingSeparating.csv"

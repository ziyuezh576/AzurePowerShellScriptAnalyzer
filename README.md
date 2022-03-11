1. Clone https://github.com/Azure/azure-powershell to "$env:USERPROFILE\source\repos"
2. Clone https://github.com/MicrosoftDocs/azure-docs-powershell to "$env:USERPROFILE\source\repos" (optional)
3. Run: Count-Examples.ps1 "$env:USERPROFILE\source\repos\azure-powershell\src" "$env:USERPROFILE\source\repos\azure-docs-powershell\azps-7.3.0"
4. It will create:
    - PowerShell codes splitted by example to ".\newps-1\\$module\\*.ps1"
    - Markdown docs with prompts deleted to ".\newmd\\$module\\*.md"
    - PowerShell codes splitted by cmdlet to ".\newps\\$module\\*.ps1"
    - Analyzing results by module to ".\newps\\$module.csv"
    - ".\Status.csv"
    - ".\Missing.csv"
    - ".\DeletingSeparating.csv"

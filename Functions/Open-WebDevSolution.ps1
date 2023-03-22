function Open-WebDevSolution {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [string]$ProjectName
    )

    $project = Get-WebDevProjects | Where-Object { $_.Name -eq $ProjectName }
    if (!$project) {
        Write-Host "Project '$ProjectName' not found."
        return
    }

    Set-Location $project.DevPath
    Get-ChildItem *.sln | Invoke-Item
}

Export-ModuleMember -Function Open-WebDevSolution
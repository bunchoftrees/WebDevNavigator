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

    if (!$project.NodeVersion) {
        Write-Host "Node version not specified for project '$ProjectName'. Please specify the Node version using Set-WebDevProject before opening the project."
        return
    }

    $switchSuccess = $false
    Switch-NodeVersion -ProjectName $ProjectName -SwitchNodeVersion_Success ([ref]$switchSuccess)

    if ($switchSuccess) {
        Write-Host "Now using $($project.NodeVersion)"
    }
    else {
        Write-Host "There was a problem switching to Node.js version: $($project.NodeVersion)" -ForegroundColor Red
    }

    Set-Location $project.DevPath
    Get-ChildItem *.sln | Invoke-Item
}

Export-ModuleMember -Function Open-WebDevSolution
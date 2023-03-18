function Get-WebDevProjects {
    [CmdletBinding()]
    param (
        [bool]$DisplayMessage = $true
    )

    $projectsFile = "$env:LOCALAPPDATA\WebDevNavigator\projects.json"
    if (!(Test-Path $env:LOCALAPPDATA\WebDevNavigator)) {
        New-Item -ItemType Directory $env:LOCALAPPDATA\WebDevNavigator | Out-Null
    }
    if (Test-Path $projectsFile) {
        $projects = Get-Content $projectsFile -Raw | ConvertFrom-Json
        return $projects
    }
    else {
        if ($DisplayMessage) {
            Write-Host "No projects found. Run Add-WebDevProject to add your first project."
        }
        return $null
    }
}

Export-ModuleMember -Function Get-WebDevProjects

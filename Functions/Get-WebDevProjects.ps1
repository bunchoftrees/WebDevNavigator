function Get-WebDevProjects {
    $projectsFile = "$env:LOCALAPPDATA\WebDevNavigator\projects.json"
    if (!(Test-Path $env:LOCALAPPDATA\WebDevNavigator)) {
        New-Item -ItemType Directory $env:LOCALAPPDATA\WebDevNavigator | Out-Null
    }
    if (Test-Path $projectsFile) {
        $projects = Get-Content $projectsFile -Raw | ConvertFrom-Json
        return $projects
    }
    else {
        return $null
    }
}

Export-ModuleMember -Function Get-WebDevProjects

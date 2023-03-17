function Get-WebDevProjects {
    $projectsFile = "$PSScriptRoot\projects.json"
    if (!(Test-Path $projectsFile)) {
        New-Item -ItemType File $projectsFile | Out-Null
        @() | ConvertTo-Json | Set-Content -Path $projectsFile
    }

    $projects = Get-Content $projectsFile -Raw | ConvertFrom-Json
    if (!$projects) {
        $projects = @()
    } elseif (-not $projects -is [System.Collections.ArrayList]) {
        $projects = [System.Collections.ArrayList]($projects)
    }

    return $projects
}

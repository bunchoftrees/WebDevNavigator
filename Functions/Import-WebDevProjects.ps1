function Import-WebDevProjects {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true, Position=0)]
        [string]$Path
    )

    if (-not (Test-Path $Path)) {
        Write-Error "File '$Path' not found."
        return
    }

    $projects = Import-Csv $Path
    if ($null -eq $projects) {
        Write-Error "No projects found in '$Path'."
        return
    }

    $projectsToAdd = $projects | ForEach-Object {
        @{
            "Name" = $_.Name
            "DevPath" = $_.DevPath
            "WebPath" = $_.WebPath
            "NodeVersion" = $_.NodeVersion
        }
    }

    $projectsFile = "$env:LOCALAPPDATA\WebDevNavigator\projects.json"
    if (!(Test-Path $projectsFile)) {
        $existingProjects = @()
    } else {
        $existingProjects = Get-Content $projectsFile | ConvertFrom-Json
    }

    $combinedProjects = @($existingProjects) + $projectsToAdd

    $combinedProjects | Select-Object @{Name='Name';Expression={$_.Name}}, 
                                    @{Name='DevPath';Expression={$_.DevPath}}, 
                                    @{Name='WebPath';Expression={$_.WebPath}},
                                    @{Name='NodeVersion';Expression={$_.NodeVersion}} | 
                    ConvertTo-Json -Depth 100 | Set-Content $projectsFile
    Write-Host "Imported $($projects.Count) projects from '$Path'."
}

Export-ModuleMember -Function Import-WebDevProjects

function Add-WebDevProject {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [string]$Name,
        [Parameter(Mandatory=$true)]
        [string]$DevPath,
        [Parameter(Mandatory=$true)]
        [string]$WebPath
    )

    $newProject = [PSCustomObject]@{
        Name = $Name
        DevPath = $DevPath
        WebPath = "C:\inetpub\wwwroot\$WebPath"
    }

    $projectsFile = "$env:LOCALAPPDATA\WebDevNavigator\projects.json"
    if (!(Test-Path $env:LOCALAPPDATA\WebDevNavigator)) {
        New-Item -ItemType Directory $env:LOCALAPPDATA\WebDevNavigator | Out-Null
    }
    $projects = Get-WebDevProjects
    if (!$projects) {
        Write-Host "No projects found. Creating a new projects list."
        $projects = @()
    }
    $newProjects = @()
    foreach ($project in $projects) {
        $newProjects += $project
    }
    $newProjects += $newProject
    $newProjects | ConvertTo-Json | Set-Content -Path $projectsFile

    Write-Host "Project '$Name' added successfully."
    Get-WebDevProjects | Format-Table -AutoSize
}

Export-ModuleMember -Function Add-WebDevProject

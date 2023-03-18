function Add-WebDevProject {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [string]$Name,
        [Parameter(Mandatory=$true)]
        [string]$WebPath,
        [Parameter(Mandatory=$true)]
        [string]$DevPath
    )

    $projects = Get-WebDevProjects -DisplayMessage $false
    if (!$projects) {
        Write-Host "No projects found. Creating a new projects list."
        $projects = @()
    }

    $newProject = [PSCustomObject] @{
        Name = $Name
        DevPath = $DevPath
        WebPath = $WebPath
    }

    $projects = @($projects) + @($newProject | Select-Object Name, DevPath, WebPath)
    $projects | ConvertTo-Json -Depth 100 | Set-Content -Path "$env:LOCALAPPDATA\WebDevNavigator\projects.json"
    Write-Host "Project '$Name' added successfully." -ForegroundColor Green
    Get-WebDevProjects | Format-Table -AutoSize
}

Export-ModuleMember -Function Add-WebDevProject

function Set-WebDevProject {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [string]$Name,
        [string]$NewName,
        [string]$DevPath,
        [string]$WebPath,
        [string]$NodeVersion
    )

    $projects = Get-WebDevProjects -DisplayMessage $false
    if (!$projects) {
        Write-Host "No projects found."
        return
    }

    $existingProject = $projects | Where-Object { $_.Name -eq $Name }
    if (!$existingProject) {
        Write-Host "Project '$Name' not found."
        return
    }

    if ($NewName) {
        $existingProject.Name = $NewName
    }

    if ($DevPath) {
        $existingProject.DevPath = $DevPath
    }

    if ($WebPath) {
        $existingProject.WebPath = $WebPath
    }

    if ($NodeVersion) {
        $existingProject.NodeVersion = $NodeVersion
    }

    Write-Host "Project details updated for project '$Name'."

    $projects | ConvertTo-Json -Depth 100 | Set-Content -Path "$env:LOCALAPPDATA\WebDevNavigator\projects.json"
    Get-WebDevProjects | Format-Table -AutoSize
}

Export-ModuleMember -Function Set-WebDevProject
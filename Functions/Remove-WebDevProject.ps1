function Remove-WebDevProject {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$false, Position=0)]
        [string]$Name = '',
        [switch]$Clean,
        [switch]$Force
    )

    if ($Clean) {
        if (-not $Force) {
            $confirmation = Read-Host (Write-Host "Are you sure you want to stop tracking all your projects?" -ForegroundColor Yellow -NoNewline) " (Y/N)"
            if ($confirmation.ToLower() -ne "y") {
                Write-Host "Operation aborted by the user."
                return
            }
        }
        $projectsFile = "$env:LOCALAPPDATA\WebDevNavigator\projects.json"
        if (Test-Path $projectsFile) {
            Remove-Item $projectsFile
            Write-Host "Projects file deleted successfully."
        }
        else {
            Write-Host "No projects file found."
        }
    }
    else {
        $projects = @(Get-WebDevProjects)
        if ($Name -eq '') {
            Write-Host "Please specify a project name to remove."
            return
        }
        $project = $projects | Where-Object { $_.Name -eq $Name }
        if ($project) {
            $projects = $projects | Where-Object { $_.Name -ne $Name }
            $projects | ConvertTo-Json -Depth 100 | Set-Content -Path "$env:LOCALAPPDATA\WebDevNavigator\projects.json"
            Write-Host "Project '$Name' removed successfully."
        }
        else {
            Write-Host "Project '$Name' not found."
        }        
    }
}

Export-ModuleMember -Function Remove-WebDevProject

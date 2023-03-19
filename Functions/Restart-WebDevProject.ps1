function Restart-WebDevProject {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true, Position=0)]
        [string]$Name
    )
    
    $projectsFile = "$env:LOCALAPPDATA\WebDevNavigator\projects.json"
    if (!(Test-Path $projectsFile)) {
        Write-Error "Projects file not found."
        return
    }
    
    $projects = Get-Content $projectsFile | ConvertFrom-Json
    
    $project = $projects | Where-Object { $_.Name -eq $Name }
    if ($null -eq $project) {
        Write-Error "Project '$Name' not found."
        return
    }
    
    $siteName = $project.WebPath
    
    $site = Get-Website | Where-Object { $_.Name -eq $siteName }
    if ($null -eq $site) {
        Write-Error "IIS site '$siteName' not found."
        return
    }
    
    Write-Host "Stopping site '$($Name)'..."
    Stop-Website $siteName
    Start-Sleep -Seconds 2
    Write-Host "Restarting site '$($Name)'..."
    Start-Website $siteName
}



Export-ModuleMember -Function Restart-WebDevProject

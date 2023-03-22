function Open-WebDevProject {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [string]$ProjectName,
        [switch]$Local,
        [switch]$Explore,
        [switch]$Code
    )

    $project = Get-WebDevProjects | Where-Object { $_.Name -eq $ProjectName }
    if (!$project) {
        Write-Host "Project '$ProjectName' not found."
        return
    }

    if ($Local -and !$Code -and !$Explore) {
        Set-Location "C:\inetpub\wwwroot$($project.WebPath)"
        return
    }

    if ($Local -and $Code) {
        Set-Location "C:\inetpub\wwwroot$($project.WebPath)"
        Start-Process -NoNewWindow "code" .
        return
    }

    if ($Local -and $Explore) {
        Set-Location "C:\inetpub\wwwroot$($project.WebPath)"
        Start-Process .
        return
    }

    if ($Code) {
        Start-Process -NoNewWindow "code" $project.DevPath
        return
    }

    if ($Explore) {
        Set-Location $project.DevPath
        Start-Process $project.DevPath
        return
    }

    Set-Location $project.DevPath
}

Export-ModuleMember -Function Open-WebDevProject

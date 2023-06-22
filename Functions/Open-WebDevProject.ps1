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

    if (!$project.NodeVersion) {
        Write-Host "Node version not specified for project '$ProjectName'. Please specify the Node version using Set-WebDevProject before opening the project."
        return
    }

    $switchSuccess = $false
    Switch-NodeVersion -ProjectName $ProjectName -SwitchNodeVersion_Success ([ref]$switchSuccess)

    if ($switchSuccess) {
        Write-Host "Now using $($project.NodeVersion)"
    }
    else {
        Write-Host "There was a problem switching to Node.js version: $($project.NodeVersion)" -ForegroundColor Red
    }

    if ($Local -and !$Code -and !$Explore) {
        Set-Location "C:\inetpub\wwwroot\$($project.WebPath)"
        return
    }

    if ($Local -and $Code) {
        Set-Location "C:\inetpub\wwwroot\$($project.WebPath)"
        Start-Process -NoNewWindow "code" .
        return
    }

    if ($Local -and $Explore) {
        Set-Location "C:\inetpub\wwwroot\$($project.WebPath)"
        Start-Process .
        return
    }

    if ($Code) {
        Set-Location $project.DevPath
        Start-Process -NoNewWindow "code" .
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

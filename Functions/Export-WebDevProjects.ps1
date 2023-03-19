function Export-WebDevProjects {
    [CmdletBinding()]
    param()

    $projects = Get-WebDevProjects
    $csvPath = Join-Path $HOME 'Documents\WebDevProjects\projects.csv'
    $csv = $projects | ConvertTo-Csv -NoTypeInformation

    if (!(Test-Path (Split-Path $csvPath))) {
        New-Item -ItemType Directory -Path (Split-Path $csvPath) | Out-Null
    }

    $csv | Out-File $csvPath

    Write-Host "Exported WebDevProjects to CSV at $csvPath"
}

Export-ModuleMember -Function Export-WebDevProjects

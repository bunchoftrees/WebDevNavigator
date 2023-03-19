function Invoke-NantInit {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true, Position=0)]
        [string]$ProjectName
    )

    $project = Get-WebDevProjects | Where-Object { $_.Name -eq $ProjectName }

    if (!$project) {
        Write-Error "Project '$ProjectName' not found."
        return
    }

    $devPath = $project.DevPath

    # Sets current directory
    $currentLocation = Get-Location

    # Navigate to the project directory
    Set-Location $devPath

    # Run the NAnt command
    cmd /c "nant init -D:env=local"

    # Return to the previous directory
    Set-Location $currentLocation
}

Export-ModuleMember -Function Invoke-NantInit

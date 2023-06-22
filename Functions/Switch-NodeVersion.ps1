function Switch-NodeVersion {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [string]$ProjectName,
        [Parameter()]
        [ref]$SwitchNodeVersion_Success
    )

    $project = Get-WebDevProjects | Where-Object { $_.Name -eq $ProjectName }
    if (!$project) {
        Write-Host "Project '$ProjectName' not found."
        return
    }

    if (!$project.NodeVersion) {
        Write-Host "Node version not specified for project '$ProjectName'. Please specify the Node version using Set-WebDevProject before switching."
        return
    }

    $nodeVersion = $project.NodeVersion

    if (-not (nvm version $nodeVersion -eq $null)) {
        # Node version is already installed
        Write-Host "Using Node.js version: $nodeVersion"
        $SwitchNodeVersion_Success.Value = $true
    }
    else {
        # Node version is not installed, install it
        Write-Host "Installing Node.js version: $nodeVersion"
        nvm install $nodeVersion

        # Check if installation was successful
        if (-not (nvm version $nodeVersion -eq $null)) {
            Write-Host "Switched to Node.js version: $nodeVersion"
            $SwitchNodeVersion_Success.Value = $true
        }
        else {
            Write-Host "Failed to switch to Node.js version: $nodeVersion" -ForegroundColor Red
            $SwitchNodeVersion_Success.Value = $false
        }
    }
}

Export-ModuleMember -Function Switch-NodeVersion

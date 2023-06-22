#Requires -RunAsAdministrator

$FunctionsPath = Join-Path $PSScriptRoot 'Functions'

Import-Module (Join-Path $FunctionsPath 'Add-WebDevProject.ps1')
Import-Module (Join-Path $FunctionsPath 'Get-WebDevProjects.ps1')
Import-Module (Join-Path $FunctionsPath 'Open-WebDevProject.ps1')
Import-Module (Join-Path $FunctionsPath 'Remove-WebDevProject.ps1')
Import-Module (Join-Path $FunctionsPath 'Invoke-NantInit.ps1')
Import-Module (Join-Path $FunctionsPath 'Restart-WebDevProject.ps1')
Import-Module (Join-Path $FunctionsPath 'Import-WebDevProjects.ps1')
Import-Module (Join-Path $FunctionsPath 'Export-WebDevProjects.ps1')
Import-Module (Join-Path $FunctionsPath 'Open-WebDevSolution.ps1')
Import-Module (Join-Path $FunctionsPath 'Set-WebDevProject.ps1')
Import-Module (Join-Path $FunctionsPath 'Switch-NodeVersion.ps1')

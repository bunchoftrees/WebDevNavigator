#
# Module manifest for module 'WebDevNavigator'
#
# Generated by: Forrest JB Hartley
#
# Generated on: 3/22/2023
#

@{

# Script module or binary module file associated with this manifest.
RootModule = 'WebDevNavigator.psm1'

# Version number of this module.
ModuleVersion = '1.2.1'

# Supported PSEditions
# CompatiblePSEditions = @()

# ID used to uniquely identify this module
GUID = 'ccba69be-1485-4565-99f8-b9ae0610ec8c'

# Author of this module
Author = 'Forrest JB Hartley'

# Company or vendor of this module
CompanyName = ''

# Copyright statement for this module
Copyright = '(c) 2023 Forrest JB Hartley. All rights reserved.'

# Description of the functionality provided by this module
Description = 'A PowerShell module for navigating web development projects'

# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion = '5.1'

# Name of the Windows PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the Windows PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# DotNetFrameworkVersion = ''

# Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# CLRVersion = ''

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
# RequiredModules = @()

# Assemblies that must be loaded prior to importing this module
# RequiredAssemblies = @()

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
# FormatsToProcess = @()

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
# NestedModules = @()

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = 'Add-WebDevProject', 'Get-WebDevProjects', 'Open-WebDevProject', 
               'Remove-WebDevProject', 'Invoke-NantInit', 'Restart-WebDevProject', 
               'Import-WebDevProjects', 'Export-WebDevProjects', 
               'Open-WebDevSolution'

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = @()

# Variables to export from this module
# VariablesToExport = @()

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = @()

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
# FileList = @()

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        # Tags = @()

        # A URL to the license for this module.
        # LicenseUri = ''

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/bunchoftrees/WebDevNavigator'

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        ReleaseNotes = 'WebDevNavigator PowerShell Module
=================================

WebDevNavigator is a PowerShell module that provides a simple way to manage and navigate between web development projects in Windows. This module allows you to:

-   Add new web projects to a list of tracked projects
-   Open a project in a code editor or file explorer
-   Navigate to a web development project''s development or local web directory in PowerShell

Requirements
------------

-   Windows PowerShell 5.0 or later
-   Administrative privileges to install the module
-   IIS
-   [VS Code](https://code.visualstudio.com/)
-   [Nant](https://nant.sourceforge.net/)

Installation
------------

You can install this module from the PowerShell Gallery by running the following command in an elevated PowerShell session:

```
Install-Module -Name WebDevNavigator
```

Usage
-----

### Adding a New Project

To add a new project to the list of tracked projects, use the `Add-WebDevProject` command with the project name, local development path, and web path:

```
Add-WebDevProject -Name "My Project" -DevPath "C:\src\myproject" -WebPath "myproject.local"
```

Note that the WebPath parameter assumes that the web server is running on the same machine as the local development environment, and that the web server root directory is located at `C:\inetpub\wwwroot`.

### Opening a Project

To open a project in a code editor or file explorer, use the `Open-WebDevProject` command with the project name and the appropriate switches:

```
Open-WebDevProject -ProjectName "My Project" -Code -Explore
```

This will open the project in Visual Studio Code and File Explorer.

### Navigating to a Project''s Development or Local Web Directory

To navigate to a project''s development or local web directory in PowerShell, use the `Open-WebDevProject` command with the project name.

```
Open-WebDevProject -ProjectName "My Project"
```

By default, using `Open-WebDevProject -ProjectName "My Project"` will `Set-Location` to the project''s development directory.

Using the `-Local` switch will navigate to the project''s IIS directory in PowerShell. You can also include `-Code` or `-Explore` when using this switch. 

### Removing a Project
To remove a project from the list of tracked projects, use the Remove-WebDevProject command with the project name:

```
Remove-WebDevProject -Name "My Project"
```

This will remove the project from the list of tracked projects.

If you want to remove all tracked projects without confirmation, use the -Clean switch:

```
Remove-WebDevProject -Clean
```

You can also add the `-Force` flag with `-Clean`. Note that this will delete the projects file without prompting for confirmation. Use with caution.

### Restarting a Local Web Environment

To restart a tracked project site in IIS, use the `Restart-WebDevProject` command with the project name as a parameter.

```
Restart-WebDevProject -Name "My Project"
```

This assumes the website name in IIS and the web path are identical.

### Nant For Projects

Using `Invoke-NantInit` will execute `nant init -D:env=local` in the root development directory the specified project.

```
Invoke-NantInit -ProjectName "My Project"
```

This assumes Nant is being used for your web project and assumes a `nant.bat` is in the root of your development directory and `env=local` exists in your `build.xml`. 

### Exporting projects

Exporting tracked projects is easy. Simply call `Export-WebDevProjects` and a .csv will be generated in your `~\Documents\WebDevProjects`.

### Importing Projects

You can import projects from .csv provided there is a header that includes `Name, DevPath, WebPath`

```
Import-WebDevProjects C:\Users\You\Documents\import.csv
```



Contributions
-------------
Contributions are welcome! If you have a feature request, bug report, or would like to contribute code, feel free to create a pull request on [GitHub](https://github.com/bunchoftrees/WebDevNavigator).
'

        # Prerelease string of this module
        # Prerelease = ''

        # Flag to indicate whether the module requires explicit user acceptance for install/update/save
        # RequireLicenseAcceptance = $false

        # External dependent modules of this module
        # ExternalModuleDependencies = @()

    } # End of PSData hashtable

 } # End of PrivateData hashtable

# HelpInfo URI of this module
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}


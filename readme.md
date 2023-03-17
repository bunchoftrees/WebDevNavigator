WebDevNavigator PowerShell Module
=================================

WebDevNavigator is a PowerShell module that provides a simple way to manage and navigate between web development projects in Windows. This module allows you to:

-   Add new web projects to a list of tracked projects
-   Open a project in a code editor or file explorer
-   Navigate to a web development project's development or local web directory in PowerShell

Requirements
------------

-   Windows PowerShell 5.0 or later
-   Administrative privileges to install the module
-   IIS
-   [VS Code](https://code.visualstudio.com/)

Installation
------------

You can install this module from the PowerShell Gallery by running the following command in an elevated PowerShell session:

`Install-Module -Name WebDevNavigator`

Usage
-----

### Adding a New Project

To add a new project to the list of tracked projects, use the `Add-WebDevProject` command with the project name, local development path, and web path:

`Add-WebDevProject -Name "My Project" -DevPath "C:\src\myproject" -WebPath "myproject.local"`

Note that the WebPath parameter assumes that the web server is running on the same machine as the local development environment, and that the web server root directory is located at `C:\inetpub\wwwroot`.

### Opening a Project

To open a project in a code editor or file explorer, use the `Open-WebDevProject` command with the project name and the appropriate switches:

`Open-WebDevProject -ProjectName "My Project" -Code -Explore`

This will open the project in Visual Studio Code and File Explorer.

### Navigating to a Project's Development or Local Web Directory

To navigate to a project's development or local web directory in PowerShell, use the `Open-WebDevProject` command with the project name.

By default, using `Open-WebDevProject -ProjectName "My Project"` will `Set-Location` to the project's development directory.

Using the `-Local` switch will navigate to the project's IIS directory in PowerShell. You can also include `-Code` and/or `-Explore` when using this switch. 

Contributions
-------------
Contributions are welcome! If you have a feature request, bug report, or would like to contribute code, feel free to create a pull request on GitHub.

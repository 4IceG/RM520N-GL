@{
    Root = 'C:\Users\camer\Documents\GitHub\RM520N-GL\source\QuecResources.ps1'
    OutputPath = 'C:\Users\camer\Documents\GitHub\RM520N-GL\'
    Package = @{
        Enabled = $true
        Host = 'IronmanPowerShellHost'
        PowerShellVersion = "Windows PowerShell"
        Obfuscate = $true
        FileVersion = '1.0'
        FileDescription = 'Quickly deploy Quectel Tools/Firmware'
        ProductName = 'QuecResources'
        ProductVersion = '1.0'
        Copyright = 'Cameron S Thompson'
        RequireElevation = $true
        ApplicationIconPath = 'C:\Users\camer\Documents\GitHub\RM520N-GL\source\FenixStar.ico'
        PackageType = 'Console'
        Platform = 'x64'
    }
    Bundle = @{
        Enabled = $true
        Modules = $true
    }
}

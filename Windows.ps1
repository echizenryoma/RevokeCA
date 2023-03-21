if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Start-Process PowerShell "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`" " -Verb RunAs;
    Exit
}

$CaDir = Join-Path $PSScriptRoot "crt"
$CaFiles = Get-Childitem -Path $CaDir -Recurse
foreach ($CaFile in $CaFiles) {
  Import-Certificate -FilePath $CaFile.FullName -CertStoreLocation "Cert:\LocalMachine\Disallowed"
}
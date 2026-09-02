$ProgressPreference = 'SilentlyContinue'

# Download Chrome Remote Desktop Host
Write-Host "Downloading Chrome Remote Desktop Host..."
$crdUrl = "https://dl.google.com/edgedl/chrome-remote-desktop/chromeremotedesktophost.msi"
$crdPath = "$env:TEMP\chromeremotedesktophost.msi"
Invoke-WebRequest -Uri $crdUrl -OutFile $crdPath -UseBasicParsing

# Install Chrome Remote Desktop Host silently
Write-Host "Installing Chrome Remote Desktop Host..."
$process = Start-Process msiexec.exe -ArgumentList "/i `"$crdPath`" /qn /norestart" -Wait -PassThru

if ($process.ExitCode -ne 0) {
    Write-Error "MSI installer exited with code $($process.ExitCode)"
    exit 1
}

Write-Host "CRD Host installed successfully."

#Gets input of what the IP and name should be
$name = Read-Host "Printer name"
$ip = Read-Host "IP-address"

#Lists available printer drivers by name only, and waits for user to input the driver
Write-Host ""
Write-Host "Available printer drivers:"
Get-PrinterDriver | Select-Object -ExpandProperty name
Write-Host ""
$driver = Read-Host "Printer driver"

#Adds a TCP/IP printer port if it doesn't already exist
if (-not (Get-PrinterPort -Name $ip -ErrorAction SilentlyContinue)) {
    Write-Host "Adding printer port..."
    Add-PrinterPort -Name $ip -PrinterHostAddress $ip
    Write-Host "Printer port has been added."
}

#Adds printer with the above specifications
Write-Host "Adding printer..."
Add-Printer -Name $name -DriverName $driver -PortName $ip -Shared
Write-Host "Printer has been added."
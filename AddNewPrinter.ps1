#Gets input of what the IP and name should be
$name = Read-Host "Printer name"
$ip = Read-Host "IP-address"

#Lists available printer drivers by name only, and waits for user to input the driver
Write-Host "`nAvailable printer drivers:"
Get-PrinterDriver | Select-Object -ExpandProperty name
$driver = Read-Host "`nPrinter driver"

#Adds a TCP/IP printer port if it doesn't already exist
if (-not (Get-PrinterPort -Name $ip -ErrorAction SilentlyContinue)) {
    Write-Host "Adding printer port..."
    Add-PrinterPort -Name $ip -PrinterHostAddress $ip
    if(Get-PrinterPort -Name $ip) {
        Write-Host "Printer port has been added."
    } else {
        Write-Host "Failed adding printer port."
    }
}

#Adds printer with the above specifications
Write-Host "Adding printer..."
Add-Printer -Name $name -DriverName $driver -PortName $ip -Shared -Published
if (Get-Printer -Name $name){
    Write-Host "Printer has been added."
} else {
    Write-Host "Failed adding printer."
}

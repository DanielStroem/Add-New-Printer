Purpose of this PowerShell script is to automatically add a new printer as a network printer, and share it with other users.
I recommend that you only use this for printer servers, as all computers that add this printer from printer settings will depend on the computer you run the script on to be online.

The script will ask you for the name you want to set for the printer, the IP address of the printer, and the printer driver you want to install on the printer.
It is recommended that the printer either has a static or a DHCP reserved IP address before you add the printer with this script.

You will need to have PowerShell opened as an administrator to be able to add the new printer.

﻿$Title = "Connection settings for vCD"
$Author = "Alan Renouf"
$Version = 1.0

# Start of Settings 
# Please Specify the IP address or Hostname of the vCD Instance to connect to
$CIServer = "192.168.0.114"
# End of Settings

# Adding PowerCLI vCD snapin
if (!(Get-Module -name VMware.VimAutomation.Cloud -erroraction silentlycontinue)) {
	Import-Module -name VMware.VimAutomation.Cloud
}

Write-CustomOut "Connecting to CI Server"

$CIConnection = Connect-CIServer $CIServer
if (-not $CIConnection.IsConnected) {
	Write-Host "Unable to connect to vCloud Director, please ensure you have altered the vCloud Director server address correctly "
	Write-Host " to specify a username and password edit the connection string in the 00 Connection Plugin"
	break
}

Write-CustomOut "Collecting CIVM Objects"
$CIVM = Get-CIVM | Sort-Object Name
Write-CustomOut "Collecting Catalog Objects"
$Catalog = Get-Catalog | Sort-Object Name
Write-CustomOut "Collecting vApp Objects"
$CIvApp = Get-CIVapp | Sort-Object Name
Write-CustomOut "Collecting Org Objects"
$Org = Get-Org | Sort-Object Name
Write-CustomOut "Collecting OrgVDC Objects"
$OrgvDC = Get-OrgvDC
Write-CustomOut "Collecting ProviderVDC Objects"
$ProviderVDC = Get-ProviderVdc

$Server = $CIServer

##############################################################
#Powershell Script to Modify Windows 10 & 11 Highlight Colors#
#
#
###...................Author: Howlborne....................###
##############################################################

#Take input for RGB and HEX color values
$hilightRGBValue = Read-Host "RGB Value for Hilight and HotTrackingColor (e.g. 123 123 123)"
$hilightHexValue = Read-Host "Hex Color Code for Hilight and HotTrackingColor (e.g. BBGGRR)"

$hilightTextRGBValue = Read-Host "RGB Value for HilightText (e.g. 123 123 123)"
$hilightTextHexValue = Read-Host "Hex Color Code for HilightText (e.g. BBGGRR)"

#RGB color paths in registry
$rgbColorsPaths = "Registry::HKEY_USERS\.DEFAULT\Control Panel\Colors",
		  "Registry::HKEY_CURRENT_USER\Control Panel\Colors",
		  "Registry::HKEY_CURRENT_USER\Control Panel\Desktop\Colors",
		  "Registry::HKEY_USERS\S-1-5-18\Control Panel\Colors",
		  "Registry::HKEY_USERS\S-1-5-19\Control Panel\Colors",
		  "Registry::HKEY_USERS\S-1-5-19\Control Panel\Desktop\Colors",
		  "Registry::HKEY_USERS\S-1-5-20\Control Panel\Colors",
		  "Registry::HKEY_USERS\S-1-5-20\Control Panel\Desktop\Colors",
		  "Registry::HKEY_USERS\S-1-5-21-*\Control Panel\Colors",
		  "Registry::HKEY_USERS\S-1-5-21-*\Control Panel\Desktop\Colors"
				
#HEX color paths in registry
$hexColorsPaths = "Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast",
                  "Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard",
                  "Registry::HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast",
                  "Registry::HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard"

# Convert the hex strings to integers (DWORD)
$hilightValue = [Convert]::ToInt32("$hilightHexValue", 16)
$hilightTextValue = [Convert]::ToInt32("$hilightTextHexValue", 16)
$hotTrackingColorValue = $hilightValue

#Set the new RGB values				
Set-ItemProperty -Path $rgbColorsPaths -Name "Hilight" -Value "$hilightRGBValue"
Set-ItemProperty -Path $rgbColorsPaths -Name "HilightText" -Value "$hilightTextRGBValue"
Set-ItemProperty -Path $rgbColorsPaths -Name "HotTrackingColor" -Value "$hilightRGBValue"

# Set the HEX registry values as DWORDs
Set-ItemProperty -Path $hexColorsPaths -Name "Hilight" -Value $hilightValue -Type DWord
Set-ItemProperty -Path $hexColorsPaths -Name "HilightText" -Value $hilightTextValue -Type DWord
Set-ItemProperty -Path $hexColorsPaths -Name "HotTrackingColor" -Value $hotTrackingColorValue -Type DWord

###..........................END...........................###
##############################################################

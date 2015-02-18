﻿try {
	$packageName = '{{PackageName}}'
	$packageSearch = 'Armory'
	$fileType = 'exe'
	$silentArgs = '/S'
	$validExitCodes = @(0)
	$unPath = "HKLM:SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall"
	$unPathx86 = "HKLM:SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall"
	$osBitness = Get-ProcessorBits
	if ($osBitness -eq 64) {
		if ($unString=(Get-ItemProperty "$unpath\*$packageSearch*" UninstallString).UninstallString) {}
			else { $unString=(Get-ItemProperty "$unPathx86\*$packageSearch*" UninstallString).UninstallString }
		} else {
		$unString = (Get-ItemProperty "$unPath\*$packageSearch*" UninstallString).UninstallString
	}
	Uninstall-ChocolateyPackage "$packageName" "$fileType" "$silentArgs" "$unString" -validExitCodes $validExitCodes
} catch {
	throw $_.Exception
}
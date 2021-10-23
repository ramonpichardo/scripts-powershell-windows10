Get-CimInstance win32_product | Select-Object Name,Version,InstallDate | Export-Csv -Path C:\Windows\Temp\swA.csv -NoTypeInformation

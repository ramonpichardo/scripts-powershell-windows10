$hostnames = Get-Content -path "hostnames.txt"
foreach ($hostname in $hostnames){
    if (Test-Connection -ComputerName $hostname -Count 1 -ErrorAction SilentlyContinue){
      Write-Host "$hostname,up"
    }
    else{
      Write-Host "$hostname,down"
    }
  }

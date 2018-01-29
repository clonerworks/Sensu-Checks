$computer = $env:COMPUTERNAME

$ipV4 = (Test-Connection -ComputerName ($env:COMPUTERNAME) -Count 1  | Select IPV4Address).IPV4Address.IPAddressToString

$subscriptions = @("Windows","IIS")

$subs = $string -join '","'
$subs = $subs.Insert(0,'"')
$subs += '"'


$json = '{
  "client": {
    "name": "'+$env:COMPUTERNAME+'",
    "address": "'+$ipV4+'",
    "subscriptions": ['+$subs+'],
    "socket": {
      "bind": "'+$ipV4+'",
      "port": 3030
    }
  }
}' | Out-File "c:\temp\client.json" -Encoding UTF8

function IP_PUBLICA {
    $ip_publica = Invoke-WebRequest ifconfig.me | Select -ExpandProperty Content 
    Write-Output "Tu ip publica es : "$ip_publica "`n"
}


function IP_LOCAL {
    $ip_local = Get-NetIPAddress -AddressFamily IPv4 | Format-Table
    Write-Output "Tu ip local es: "
    Write-Output $ip_local
} 


function nmap_ip {
    $ip_privada = Get-NetIPAddress -AddressFamily IPv4 -InterfaceIndex 11 
    $ipaddress = $ip_privada.IPAddress
    $nmap = nmap.exe $ipaddress
    Write-Output "Se hizo un nmap a: "$ipaddress $nmap
}

function nmap_url {
    $url = 'www.elpugilato.com'
    $nmap2 = nmap.exe $url
    Write-Output "-----------------------------------------------------------"
    Write-Output "`n" "Se hizo un nmap a: "$url $nmap2
}

IP_PUBLICA | Out-File -FilePath ./resultados_sincodif.txt 
IP_LOCAL | Out-File -FilePath ./resultados_sincodif.txt -Append
nmap_ip | Out-File -FilePath ./resultados_sincodif.txt -Append
nmap_url | Out-File -FilePath ./resultados_sincodif.txt -Append

$file = ".\resultados_sincodif.txt"
[System.Convert]::ToBase64String((Get-Content $file -Encoding Byte)) | Out-File -FilePath ./codif_base64.txt 
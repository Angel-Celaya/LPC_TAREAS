Function Error {
param ([string]$reco)
Write-Host "Ve videos en yt de como hacer uno"
}
$contador=1
Write-Host "Esta es un encuesta hecha para 3 personas, asignese un numero cada quien"
while($contador -lt 4){
Write-Host "Ingrese el numero de veces que a hecho un script en su vida, si no a hecho ninguno ponga 0"
$num = Read-Host "Ingrese numero"
if ($num -eq 0){
Write-Host "Que mal te recomendamos que hagas esto:"
Error Ve_Tutoriales_EnYT
$contador++
}
else{
Write-Host "Bien por ti"
$contador++
}
}                                                                                                                                                                                                             
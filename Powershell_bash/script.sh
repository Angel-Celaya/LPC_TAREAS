contador=0
function mayor {
echo "Eres mayor de edad asi que te recomiendo que hagas esto"
echo $1
echo $2
}
while [ $contador -lt 5 ];
do
echo "Tendra que ingresar un total de 5 edades"
echo "Ingresa una edad"
read num
if [ $num -lt 18 ]
then
echo "Es menor de edad"
let contador=contador+1
else
echo "Es mayor de edad"
let contador=contador+1
mayor  Tramita_Tu_Ine Tramita_Tu_Cartilla_Militar
fi
done



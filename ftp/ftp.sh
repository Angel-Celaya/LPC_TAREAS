#!/bin/bash

download() {
    ftp -inv $1 <<EOF
    user $2 $3
    cd $carpeta
    mget "*.txt"
    bye
EOF
}

cd $4

c=$(lftp -e "find -d " $1)
num_c=`echo $c | wc -w`

for i in $(seq $num_c)
do
    c=$(echo $c | cut -d' ' -f$i)
    download "$1" "$2" "$3" "$carpeta"
done

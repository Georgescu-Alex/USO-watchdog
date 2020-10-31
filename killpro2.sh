#!/bin/sh
while true;
do
        mempro=$(ps -p $1 -o vsz | sed s/VSZ//)
        if(($mempro > $2))
        then
                echo "Memorie depasita, $3 se va inchide"
                sleep 2
                pkill $3
                break
        fi
done


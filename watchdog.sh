#!/bin/sh
while true;
do
        echo "Numele procesului:"
        read proces
        echo "$proces foloseste:"
        propid=$(pgrep $proces)
        ps -p $propid -o user,vsz,%cpu
        echo "Memorie maxima $proces"
        read memmax
	echo "Redeschidere $proces in caz de depasire $memmax? (y/n)"
	read yn
	if [ $yn = "y" ]
	then
		source /home/alex/proiect/watchdog/killpro.sh $propid $memmax $proces &
	elif [ $yn = "n" ]
	then
		source /home/alex/proiect/watchdog/killpro2.sh $propid $memmax $proces &
        fi
	echo "Continuare urmarire procese ? (y/n) "
        read ans
        if [ $ans = "n" ]
        then
                break
        fi
sleep 2
done


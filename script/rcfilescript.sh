	a=1

	c1000=1000
	c1000000=1000000

        integerValue=$(($1/1000))
        fractionalValue=$(( $1%c1000 ))
	toggleTimeInt=$(( ($2*1000)/$1 ))
	toggleTimeFrac=$((( 1000000*$2)/$1%1000 ))
 	fileEnd="GHz.s"
	period=$((1000000/$1))

	echo $period

	while read line
	do           	
		
		currentline=$line


		if [ $a == "4" ]
		then
                    	len=${#currentline}
                        currentline=${currentline:0:36}$period${currentline:36:len}

		fi
		

#		if [ $a == "8" ]
#		then
#			len=${#currentline}
#			currentline=${currentline:0:38}0.001${currentline:38:len}
#		fi

		if [ $a == "8" ]
		then
			len=${#currentline}
			 
			currentline=${currentline:0:38}$toggleTimeInt.$toggleTimeFrac${currentline:38:len}
		fi

#		if [ $a == "10" ]
#		then
#                   	len=${#currentline}
#                      currentline=${currentline:0:38}$toggleTimeInt.$toggleTimeFrac${currentline:38:len}
#		fi

		if [ $a == "12" ] 
		then
                    	len=${#currentline}
                        currentline=${currentline:0:25}$integerValue.$fractionalValue${currentline:25:len}		
		fi

		if [ $a == "13" ]
		then
                    	len=${#currentline}
                        currentline=${currentline:0:27}$integerValue.$fractionalValue${currentline:27:len}
		fi

		if [ $a = "1" ]
		then 
			echo -e "$currentline" > sources/sim-$integerValue.$fractionalValue$fileEnd
		else
			echo -e "$currentline" >> sources/sim-$integerValue.$fractionalValue$fileEnd
		fi		
		let "a += 1"       
	done <sources/sim-basis.s

	echo "done"
